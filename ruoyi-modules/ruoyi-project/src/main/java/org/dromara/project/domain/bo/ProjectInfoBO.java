package org.dromara.project.domain.bo;

import jakarta.validation.Valid;
import lombok.Data;

import java.util.List;

/**
 * 项目信息BO
 *
 * @author bailingnan
 * @date 2023/12/15
 */
@Data
public class ProjectInfoBO {

    /**
     * 项目信息
     */
    @Valid
    private ProjectBaseInfoBO projectBaseInfoBO;

    /**
     * 成员信息
     */
    @Valid
    private List<ProjectUserBo> projectUserBoList;

    /**
     * 经费信息
     */
    @Valid
    private ProjectFundsBO projectFundsBO;

    /**
     * 指标信息
     */
    @Valid
    private List<ProjectTargetBO> projectTargetBOList;

    /**
     * 附件信息
     */
    @Valid
    //private List<ProjectAttachmentBO> projectAttachmentBOList;
    private List<Long> ossIdList;

    /**
     * 计划信息
     */
    @Valid
    private List<ProjectPlanBO> projectPlanBOList;
}
