package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 项目附件表
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@TableName(value = "project_attachment")
@Data
public class ProjectAttachment implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
    /**
     *
     */
    private Long id;
    /**
     *
     */
    private Long projectId;
    /**
     *
     */
    private Long ossId;

    /**
     * 租户编号
     */
    private String tenantId;
}
