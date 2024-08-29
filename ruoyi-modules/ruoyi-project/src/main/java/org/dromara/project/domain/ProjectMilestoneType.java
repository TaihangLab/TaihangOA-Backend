package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.dromara.common.core.enums.ProjectMilestoneTypeEnum;

import java.io.Serial;
import java.io.Serializable;

/**
 * 大事记分类表
 * @author bailingnan
 * @date 2024/3/25 14:31
 */
@TableName("project_milestone_type")
@Data
public class ProjectMilestoneType implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long Id;

    /**
     * 大事记ID
     */
    private Long milestoneId;

    /**
     * 大事记分类
     */
    private ProjectMilestoneTypeEnum milestoneType;
    /**
     * 租户编号
     */
    private String tenantId;
}
