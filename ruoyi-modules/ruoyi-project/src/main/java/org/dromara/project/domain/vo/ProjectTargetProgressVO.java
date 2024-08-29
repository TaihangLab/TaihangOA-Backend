package org.dromara.project.domain.vo;

import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.project.domain.ProjectTargetProgress;

import java.time.LocalDate;

/**
 * 项目指标进度VO
 *
 * @author bailingnan
 * @date 2024/8/22
 */
@Data
@AutoMapper(target = ProjectTargetProgress.class)
public class ProjectTargetProgressVO {
    /**
     * 进度id
     */
    private Long progressId;

    /**
     * 指标id
     */
    private Long targetId;

    /**
     * 完成情况
     */
    private String completionStatus;

    /**
     * 详细描述
     */
    private String detailedDescription;

    /**
     * 完成时间
     */
    private LocalDate completionTime;
}
