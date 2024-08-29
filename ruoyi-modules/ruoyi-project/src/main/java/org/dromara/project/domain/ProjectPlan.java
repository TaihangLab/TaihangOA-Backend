package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;

/**
 * 项目计划表
 *
 * @author bailingnan
 * @TableName project_plan
 * @date 2024/02/06
 */
@Data
@EqualsAndHashCode(of = {"projectId", "stageStartDate", "stageEndDate", "stageTask"})
@TableName(value = "project_plan")
public class ProjectPlan implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 阶段id
     */
    @TableId(type = IdType.AUTO)
    private Long stageId;

    /**
     * 项目Id
     */
    private Long projectId;

    /**
     * 阶段开始日期
     */
    private LocalDate stageStartDate;

    /**
     * 阶段结束日期
     */
    private LocalDate stageEndDate;

    /**
     * 阶段任务
     */
    private String stageTask;

    /**
     * 租户编号
     */
    private String tenantId;
}

