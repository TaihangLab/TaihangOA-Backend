package org.dromara.project.domain.bo;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.dromara.common.core.enums.ProjectMilestoneTypeEnum;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.core.xss.Xss;
import org.dromara.common.mybatis.core.domain.BaseEntity;

import java.time.LocalDate;
import java.util.List;

/**
 * 项目大事记BO
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ProjectMilestoneBo extends BaseEntity {

    private static final long serialVersionUID = 8500261585170629082L;
    /**
     * 大事记ID
     */
    private Long milestoneId;

    /**
     * 项目ID
     */
    private Long projectId;

    /**
     * 大事记名称
     */
    @Xss(message = "大事记名称不能包含脚本字符")
    @NotBlank(message = "大事记名称不能为空", groups = {AddGroup.class, EditGroup.class})
    @Size(min = 0, max = 20, message = "大事记名称不能超过{max}个字符", groups = {AddGroup.class, EditGroup.class})
    private String milestoneTitle;

    /**
     * 大事记描述
     */
    @NotBlank(message = "大事记描述不能为空", groups = {AddGroup.class, EditGroup.class})
    private String milestoneRemark;

    /**
     * 大事记时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate milestoneDate;

    /**
     * 大事记对应ossID列表
     */
    private List<Long> ossIds;

    /**
     * 搜索关键字
     */
    private String keyword;

    /**
     * 搜索大事纪起始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate milestoneStaTime;

    /**
     * 搜索大事纪结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate milestoneEndTime;

    /**
     * 大事记分类id
     */
    private Long milestoneCategoryId;

    /**
     * 大事记对应的分类
     */
    private ProjectMilestoneTypeEnum milestoneType;

    /**
     * 大事记分类列表
     */
    private List<ProjectMilestoneTypeEnum> projectMilestoneTypes;

}
