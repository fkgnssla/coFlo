package com.reviewping.coflo.domain.link.controller.dto;

import com.reviewping.coflo.domain.link.controller.dto.request.GitlabSearchRequest;
import com.reviewping.coflo.domain.link.controller.dto.request.ProjectLinkRequest;
import com.reviewping.coflo.domain.link.controller.dto.response.GitlabProjectPageResponse;
import com.reviewping.coflo.domain.link.service.LinkService;
import com.reviewping.coflo.global.auth.oauth.model.AuthUser;
import com.reviewping.coflo.global.common.response.ApiResponse;
import com.reviewping.coflo.global.common.response.impl.ApiSuccessResponse;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/link")
@RequiredArgsConstructor
public class LinkController {

    private final LinkService linkService;

    @GetMapping("/search")
    public ApiResponse<GitlabProjectPageResponse> getGitlabProjects(
            @AuthenticationPrincipal AuthUser authUser,
            @RequestParam(name = "keyword", defaultValue = "") String keyword,
            @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "size", defaultValue = "10") int size) {
        GitlabProjectPageResponse gitlabProjects =
                linkService.getGitlabProjects(
                        authUser.getUserId(), new GitlabSearchRequest(keyword, page, size));
        return ApiSuccessResponse.success(gitlabProjects);
    }

    @PostMapping("/{gitlabProjectId}")
    public ApiResponse<Map<String, Long>> linkGitlabProject(
            @AuthenticationPrincipal AuthUser authUser,
            @PathVariable("gitlabProjectId") Long gitlabProjectId,
            @RequestBody(required = false) ProjectLinkRequest projectLinkRequest) {
        Long projectId =
                linkService.linkGitlabProject(
                        authUser.getUserId(), gitlabProjectId, projectLinkRequest);
        return ApiSuccessResponse.success("projectId", projectId);
    }

    @GetMapping("/status")
    public ApiResponse<Map<String, Boolean>> lingStatus(
            @AuthenticationPrincipal AuthUser authUser) {
        boolean hasLinkedProject = linkService.hasLinkedProject(authUser.getUserId());
        return ApiSuccessResponse.success("hasLinkedProject", hasLinkedProject);
    }
}
