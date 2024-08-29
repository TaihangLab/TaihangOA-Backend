package org.dromara.project.domain.bo;

import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.project.domain.ProjectTargetProgress;

import java.time.LocalDate;

/**
 * 项目指标进度BO
 *
 * @author bailingnan
 * @date 2024/8/22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@AutoMapper(target = ProjectTargetProgress.class, reverseConvertGenerate = false)
public class ProjectTargetProgressBO extends BaseEntity {
    /**
     * 进度id
     */
    @NotNull(message = "进度id不能为空", groups = {EditGroup.class})
    private Long progressId;

    /**
     * 指标id
     */
    private Long targetId;

    /**
     * 完成情况
     */
    @NotBlank(message = "项目指标完成情况不能为空", groups = {AddGroup.class, EditGroup.class})
    @Size(max = 300, message = "项目指标完成情况不能超过{max}个字符")
    private String completionStatus;

    /**
     * 详细描述
     */
    @Size(max = 3000, message = "项目指标完成情况不能超过{max}个字符")
    private String detailedDescription;

    /**
     * 完成时间
     */
    private LocalDate completionTime;
}
