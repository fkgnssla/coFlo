package com.reviewping.coflo.domain.review.controller.dto.request;

import com.reviewping.coflo.domain.review.entity.LanguageType;
import com.reviewping.coflo.global.common.enums.EnumValue;
import jakarta.validation.Valid;
import java.util.List;

public record RegenerateReviewRequest(
        Long projectId, Long gitlabMrIid, @Valid List<RetrievalContent> retrievals) {
    public record RetrievalContent(
            String content,
            String fileName,
            @EnumValue(
                            enumClass = LanguageType.class,
                            message = "지원하지 않는 언어입니다.",
                            ignoreCase = true)
                    String language) {}
}
