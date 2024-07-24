package org.dromara.project.domain.vo;

import lombok.Data;
import org.dromara.common.core.enums.ProjectMilestoneTypeEnum;
import org.dromara.system.domain.SysOss;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Data
public class ProjectMilestoneVO {

    /**
     * 大事纪ID
     */
    private Long milestoneId;

    /**
     * 项目ID
     */
    private Long projectId;

    /**
     * 大事记名称
     */
    private String milestoneTitle;

    /**
     * 大事记描述
     */
    private String milestoneRemark;

    /**
     * 大事记时间
     */
    private LocalDate milestoneDate;

    /**
     * 项目大事纪对应的oss对象
     */
    private List<SysOss> sysOsses;

    /**
     * 项目大事记分类列表
     */
    private Set<ProjectMilestoneTypeEnum> categoryTypeSet;
}
