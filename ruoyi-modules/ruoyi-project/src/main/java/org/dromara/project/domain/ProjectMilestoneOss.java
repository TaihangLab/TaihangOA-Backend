package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 项目大事纪文件oss关联表
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Data
@TableName("project_milestone_oss")
public class ProjectMilestoneOss {
    /**
     * 项目大事纪ID
     */
    @TableId
    private Long milestoneId;

    /**
     * ossID
     */

    private Long ossId;

    /**
     * 租户编号
     */
    private String tenantId;
}
