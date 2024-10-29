package com.reviewping.coflo.domain.mergerequest.controller;

import com.reviewping.coflo.domain.link.controller.dto.request.GitlabSearchRequest;
import com.reviewping.coflo.domain.mergerequest.controller.dto.response.GitlabMrPageResponse;
import com.reviewping.coflo.domain.mergerequest.service.MergeRequestService;
import com.reviewping.coflo.domain.user.entity.User;
import com.reviewping.coflo.global.auth.AuthUser;
import com.reviewping.coflo.global.common.response.ApiResponse;
import com.reviewping.coflo.global.common.response.impl.ApiSuccessResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/merge-requests")
public class MergeRequestController {

    private final MergeRequestService mergeRequestService;

    @GetMapping
    public ApiResponse<GitlabMrPageResponse> getGitlabMergeRequests(
            @AuthUser User user,
            @RequestParam(name = "project_id") Long projectId,
            @RequestParam(name = "state") String state,
            @RequestBody GitlabSearchRequest gitlabSearchRequest) {
        GitlabMrPageResponse gitlabMergeRequests =
                mergeRequestService.getGitlabMergeRequests(
                        user.getId(), projectId, state, gitlabSearchRequest);
        return ApiSuccessResponse.success(gitlabMergeRequests);
    }
}
