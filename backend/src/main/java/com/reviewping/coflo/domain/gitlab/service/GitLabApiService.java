package com.reviewping.coflo.domain.gitlab.service;

import com.reviewping.coflo.domain.gitlab.dto.response.GitlabMrDiffsContent;
import com.reviewping.coflo.domain.gitlab.dto.response.GitlabProjectContent;
import com.reviewping.coflo.domain.gitlab.dto.response.GitlabUserInfoContent;
import com.reviewping.coflo.global.util.RestTemplateUtils;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class GitLabApiService {

    @Value("${gitlab.api.project-search}")
    private String projectListEndpoint;

    @Value("${gitlab.api.user-info}")
    private String userInfoEndpoint;

    private static final String URL_PROTOCOL_HTTPS = "https://";
    private static final String MIME_TYPE_JSON = "application/json";

    public List<GitlabProjectContent> searchGitlabProjects(
            String gitlabUrl, String token, String searchQuery) {
        HttpHeaders headers = RestTemplateUtils.createHeaders(MIME_TYPE_JSON, token);
        String url = URL_PROTOCOL_HTTPS + gitlabUrl + projectListEndpoint + searchQuery;

        ResponseEntity<List<GitlabProjectContent>> response =
                RestTemplateUtils.sendGetRequest(
                        url,
                        headers,
                        new ParameterizedTypeReference<List<GitlabProjectContent>>() {});
        return response.getBody();
    }

    public GitlabUserInfoContent getUserInfo(String gitlabUrl, String token) {
        HttpHeaders headers = RestTemplateUtils.createHeaders(MIME_TYPE_JSON, token);
        String url = URL_PROTOCOL_HTTPS + gitlabUrl + userInfoEndpoint;

        ResponseEntity<GitlabUserInfoContent> response =
                RestTemplateUtils.sendGetRequest(
                        url, headers, new ParameterizedTypeReference<GitlabUserInfoContent>() {});
        return response.getBody();
    }

    public GitlabMrDiffsContent getMrDiffs(
            String gitlabUrl, String token, Long gitlabProjectId, Long iid) {
        HttpHeaders headers = RestTemplateUtils.createHeaders(MIME_TYPE_JSON, token);
        String url = makeMRDiffsUrl(gitlabUrl, gitlabProjectId, iid);

        ResponseEntity<GitlabMrDiffsContent> response =
                RestTemplateUtils.sendGetRequest(
                        url, headers, new ParameterizedTypeReference<>() {});
        return response.getBody();
    }

    public void addNoteToMr(
            String gitlabUrl, String token, Long gitlabProjectId, Long iid, String chatMessage) {
        HttpHeaders headers = RestTemplateUtils.createHeaders(MIME_TYPE_JSON, token);
        String url = makeNoteToMRUrl(gitlabUrl, gitlabProjectId, iid);
        RestTemplateUtils.sendPostRequest(
                url, headers, chatMessage, new ParameterizedTypeReference<>() {});
    }

    private String makeMRDiffsUrl(String gitlabUrl, Long gitlabProjectId, Long iid) {
        return URL_PROTOCOL_HTTPS
                + gitlabUrl
                + "/projects/"
                + gitlabProjectId
                + "/merge_requests/"
                + iid
                + "/diffs";
    }

    private String makeNoteToMRUrl(String gitlabUrl, Long gitlabProjectId, Long iid) {
        return URL_PROTOCOL_HTTPS
                + gitlabUrl
                + "/projects/"
                + gitlabProjectId
                + "/merge_requests/"
                + iid
                + "/notes";
    }
}
