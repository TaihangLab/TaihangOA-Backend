package org.dromara.project.service;

import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.bo.ProjectBaseInfoBO;
import org.dromara.project.domain.vo.ProjectFundsManagementVO;

import java.util.List;

/**
 * 项目经费管理Service
 *
 * @author bailingnan
 * @date 2024/03/04
 */
public interface ProjectFundsManagementService {
    TableDataInfo<ProjectFundsManagementVO> queryPageList(ProjectBaseInfoBO projectBaseInfoBO, PageQuery pageQuery);

    List<ProjectFundsManagementVO> queryList(ProjectBaseInfoBO projectBaseInfoBO);
}
