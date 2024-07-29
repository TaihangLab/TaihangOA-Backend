package org.dromara.project.service;

import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.ProjectExpenditure;
import org.dromara.project.domain.bo.ProjectExpenditureBO;
import org.dromara.project.domain.vo.ProjectExpenditureVO;

import java.util.List;

/**
 * 项目支出Service
 *
 * @author bailingnan
 * @date 2024/03/01
 */
public interface ProjectExpenditureService {

    /**
     * 根据项目id查询项目支出信息
     *
     * @param ExpenditureIdList
     *
     * @return
     */
    List<ProjectExpenditure> getProjectExpenditureByExpId(List<Long> ExpenditureIdList);

    /**
     * 批量插入项目支出信息
     *
     * @param projectExpenditureBOList
     */
    void addProjectExpenditureList(List<ProjectExpenditureBO> projectExpenditureBOList);

    /**
     * 回滚支出记录
     *
     * @param expenditureId
     */
    void rollBackProjectExpenditureById(Long expenditureId) throws IllegalAccessException;

    /**
     * 查询项目支出明细
     *
     * @param projectExpenditureBO
     * @param pageQuery
     *
     * @return
     */
    TableDataInfo<ProjectExpenditureVO> getProjectExpenditureByProId(ProjectExpenditureBO projectExpenditureBO,
        PageQuery pageQuery);

    /**
     * 查询项目支出明细
     *
     * @param projectExpenditureBO
     *
     * @return
     */
    List<ProjectExpenditure> getProjectExpenditureByProId(ProjectExpenditureBO projectExpenditureBO);
}
