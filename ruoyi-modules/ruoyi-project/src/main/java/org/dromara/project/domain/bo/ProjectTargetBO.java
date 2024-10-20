package org.dromara.project.domain.bo;

import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.project.domain.ProjectTarget;

/**
 * 项目指标BO
 *
 * @author bailingnan
 * @date 2023/12/15
 */
@Data
@AutoMapper(target = ProjectTarget.class, reverseConvertGenerate = false)
public class ProjectTargetBO {
    /**
     * 指标ID
     */
    private Long targetId;
    /**
     * 项目ID
     */
    @NotNull(message = "项目ID不能为空", groups = {QueryGroup.class})
    private Long projectId;
    /**
     * 指标名称
     */
    @NotBlank(message = "指标名称不能为空", groups = {AddGroup.class, EditGroup.class})
    @Size(min = 0, max = 50, message = "指标描述不能超过{max}个字符")
    private String targetName;

    /**
     * 中期指标值/状态
     */
    //    @NotBlank(message = "中期指标不能为空", groups = {AddGroup.class, EditGroup.class})
    @Size(min = 0, max = 200, message = "中期指标不能超过{max}个字符")
    private String midtermTarget;

    /**
     * 完成时指标值/状态
     */
    //    @NotBlank(message = "完成时指标不能为空", groups = {AddGroup.class, EditGroup.class})
    @Size(min = 0, max = 200, message = "完成时指标不能超过{max}个字符")
    private String endTarget;
}
