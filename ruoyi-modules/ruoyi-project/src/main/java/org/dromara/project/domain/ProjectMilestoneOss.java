package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 项目大事纪文件oss关联表
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Data
@TableName("project_milestone_oss")
public class ProjectMilestoneOss implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
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
