package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.io.Serializable;

/**
 * 项目和指标关联表 project_target
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Data
@EqualsAndHashCode(of = {"projectId", "targetName", "midtermTarget", "endTarget"})
@TableName("project_target")
public class ProjectTarget implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 指标ID
     */
    @TableId(type = IdType.AUTO)
    private Long targetId;

    /**
     * 项目ID
     */
    private Long projectId;

    /**
     * 指标名称
     */
    private String targetName;

    /**
     * 中期指标值/状态
     */
    private String midtermTarget;

    /**
     * 完成时指标值/状态
     */
    private String endTarget;

    /**
     * 租户编号
     */
    private String tenantId;
}

