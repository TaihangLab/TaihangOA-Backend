package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.dromara.common.core.enums.ProjectUserRoleEnum;

import java.io.Serial;
import java.io.Serializable;

/**
 * 项目和用户关联 project_user
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Data
@EqualsAndHashCode(of = {"projectId", "userId", "projectUserRole"})
@TableName("project_user")
public class ProjectUser implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 项目ID
     */
    @TableId(type = IdType.INPUT)
    private Long projectId;

    /**
     * 人员id
     */
    private Long userId;

    /**
     * 项目成员角色（0：项目负责人；1：公司负责人；2：部门负责人；3：科研管理负责人；4：普通成员）
     */
    private ProjectUserRoleEnum projectUserRole;

    /**
     * 租户编号
     */
    private String tenantId;
}

