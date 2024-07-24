package org.dromara.project.domain.vo;

import lombok.Data;
import org.dromara.project.domain.ProjectBaseInfo;

import java.util.List;

/**
 * 项目成员详情VO
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Data
public class ProjectUserDetailVO {

    /**
     * 当前参与的国家级项目详情
     */
    private List<ProjectBaseInfo> nationProjectBaseInfos;

    /**
     * 当前参与的省级项目详情
     */
    private List<ProjectBaseInfo> provincialProjectBaseInfos;

    /**
     * 当前参与的自建项目详情
     */
    private List<ProjectBaseInfo> enterpriseProjectBaseInfos;

}
