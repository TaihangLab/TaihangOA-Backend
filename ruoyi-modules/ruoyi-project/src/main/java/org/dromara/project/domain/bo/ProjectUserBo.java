package org.dromara.project.domain.bo;

import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.common.core.enums.ProjectUserRoleEnum;
import org.dromara.project.domain.ProjectUser;

import java.util.List;

/**
 * 项目成员BO
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Data
@AutoMapper(target = ProjectUser.class, reverseConvertGenerate = false)
public class ProjectUserBo {
    /**
     * 项目ID
     */
    private Long projectId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 项目成员角色（0：项目负责人；1：公司负责人；2：部门负责人；3：科研管理负责人；4：普通成员）
     */
    private List<ProjectUserRoleEnum> projectUserRoleList;
}
