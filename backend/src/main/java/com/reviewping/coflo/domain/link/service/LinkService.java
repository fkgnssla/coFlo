package com.reviewping.coflo.domain.link.service;

import static com.reviewping.coflo.global.error.ErrorCode.*;

import com.reviewping.coflo.domain.gitlab.dto.response.GitlabProjectDetailContent;
import com.reviewping.coflo.domain.gitlab.dto.response.GitlabProjectPageContent;
import com.reviewping.coflo.domain.gitlab.service.GitLabApiService;
import com.reviewping.coflo.domain.link.controller.dto.request.GitlabSearchRequest;
import com.reviewping.coflo.domain.link.controller.dto.request.ProjectLinkRequest;
import com.reviewping.coflo.domain.link.controller.dto.response.GitlabProjectPageResponse;
import com.reviewping.coflo.domain.link.controller.dto.response.GitlabProjectResponse;
import com.reviewping.coflo.domain.project.entity.Project;
import com.reviewping.coflo.domain.project.repository.ProjectRepository;
import com.reviewping.coflo.domain.user.entity.GitlabAccount;
import com.reviewping.coflo.domain.user.entity.User;
import com.reviewping.coflo.domain.user.repository.GitlabAccountRepository;
import com.reviewping.coflo.domain.user.repository.UserRepository;
import com.reviewping.coflo.domain.userproject.entity.UserProject;
import com.reviewping.coflo.domain.userproject.repository.UserProjectRepository;
import com.reviewping.coflo.global.error.exception.BusinessException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class LinkService {

    private final GitLabApiService gitLabApiService;
    private final UserRepository userRepository;
    private final ProjectRepository projectRepository;
    private final UserProjectRepository userProjectRepository;
    private final GitlabAccountRepository gitlabAccountRepository;

    public GitlabProjectPageResponse getGitlabProjects(
            Long userId, GitlabSearchRequest gitlabSearchRequest) {
        GitlabAccount gitlabAccount = findGitlabAccountByUserId(userId);
        GitlabProjectPageContent gitlabProjectPage =
                gitLabApiService.searchGitlabProjects(
                        gitlabAccount.getDomain(),
                        gitlabAccount.getUserToken(),
                        gitlabSearchRequest);

        List<GitlabProjectResponse> gitlabProjectList =
                gitlabProjectPage.gitlabProjectDetailContents().stream()
                        .map(project -> buildGitlabProjectResponse(project, gitlabAccount.getId()))
                        .toList();

        return GitlabProjectPageResponse.of(gitlabProjectList, gitlabProjectPage.pageDetail());
    }

    @Transactional
    public Long linkGitlabProject(
            Long userId, Long gitlabProjectId, ProjectLinkRequest projectLinkRequest) {
        GitlabAccount gitlabAccount = findGitlabAccountByUserId(userId);
        Project project = getOrCreateProject(gitlabProjectId, projectLinkRequest, gitlabAccount);
        UserProject savedProject =
                userProjectRepository.save(
                        UserProject.builder()
                                .project(project)
                                .gitlabAccount(gitlabAccount)
                                .build());
        return savedProject.getId();
    }

    public boolean hasLikedProject(Long userId) {
        User user = findUserById(userId);
        return userProjectRepository.existsByGitlabAccountUser(user);
    }

    private User findUserById(Long userId) {
        return userRepository
                .findById(userId)
                .orElseThrow(() -> new BusinessException(USER_NOT_EXIST));
    }

    private GitlabAccount findGitlabAccountByUserId(Long userId) {
        User user = findUserById(userId);
        return gitlabAccountRepository
                .findFirstByUserOrderByIdAsc(user)
                .orElseThrow(() -> new BusinessException(USER_GITLAB_ACCOUNT_NOT_EXIST));
    }

    private GitlabProjectResponse buildGitlabProjectResponse(
            GitlabProjectDetailContent content, Long gitlabAccountId) {
        return projectRepository
                .findByGitlabProjectId(content.id())
                .map(
                        project -> {
                            boolean isLinked = isProjectLinked(gitlabAccountId, project.getId());
                            return GitlabProjectResponse.ofLinkable(content, isLinked);
                        })
                .orElseGet(() -> GitlabProjectResponse.ofNonLinkable(content));
    }

    private boolean isProjectLinked(Long gitlabAccountId, Long projectId) {
        return userProjectRepository.existsByGitlabAccountIdAndProjectId(
                gitlabAccountId, projectId);
    }

    private Project getOrCreateProject(
            Long gitlabProjectId,
            ProjectLinkRequest projectLinkRequest,
            GitlabAccount gitlabAccount) {
        return projectRepository
                .findByGitlabProjectId(gitlabProjectId)
                .orElseGet(() -> createProject(gitlabAccount, gitlabProjectId, projectLinkRequest));
    }

    private Project createProject(
            GitlabAccount gitlabAccount,
            Long gitlabProjectId,
            ProjectLinkRequest projectLinkRequest) {

        if (projectLinkRequest == null || projectLinkRequest.botToken() == null) {
            throw new BusinessException(LINK_BOT_TOKEN_NOT_EXIST);
        }
        gitLabApiService.validateToken(gitlabAccount.getDomain(), projectLinkRequest.botToken());

        String gitlabProjectName =
                gitLabApiService
                        .getSingleProject(
                                gitlabAccount.getDomain(),
                                gitlabAccount.getUserToken(),
                                gitlabProjectId)
                        .name();

        Project project =
                Project.builder()
                        .gitlabProjectId(gitlabProjectId)
                        .botToken(projectLinkRequest.botToken())
                        .name(gitlabProjectName)
                        .build();
        return projectRepository.save(project);
    }
}
