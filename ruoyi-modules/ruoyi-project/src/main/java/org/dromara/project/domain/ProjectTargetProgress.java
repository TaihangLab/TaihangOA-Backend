package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.dromara.common.tenant.core.TenantEntity;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;

/**
 * 项目指标进度表
 *
 * @TableName project_target_progress
 */

@EqualsAndHashCode(callSuper = false)
@TableName(value = "project_target_progress")
@Data
public class ProjectTargetProgress extends TenantEntity implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
    /**
     * 进度id
     */
    @TableId(type = IdType.AUTO)
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
    /**
     * 是否删除，2删除，0未删除
     */
    @TableLogic
    @TableField(select = false)
    private Integer deleted;
    /**
     * 租户编号
     */
    private String tenantId;
}
