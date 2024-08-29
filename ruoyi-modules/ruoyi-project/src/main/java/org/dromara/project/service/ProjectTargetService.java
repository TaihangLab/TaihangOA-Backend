package org.dromara.project.service;

import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.ProjectTarget;
import org.dromara.project.domain.bo.ProjectTargetBO;
import org.dromara.project.domain.vo.ProjectTargetVO;

import java.util.List;

/**
 * 项目指标Service接口
 *
 * @author bailingnan
 * @date 2024/02/06
 */
public interface ProjectTargetService {

    /**
     * 新增多个项目指标
     *
     * @param projectTargets
     *
     * @return boolean
     */
    boolean insertProjectTargetList(List<ProjectTarget> projectTargets);

    /**
     * 新增多个项目指标
     *
     * @param projectTargetBoList
     * @param projectId
     */
    void insertProjectTargetList(List<ProjectTargetBO> projectTargetBoList, Long projectId);

    /**
     * 根据项目id查询项目指标
     *
     * @param projectId
     *
     * @return {@link List}<{@link ProjectTargetVO}>
     */
    List<ProjectTargetVO> selectTargetListByProjectId(Long projectId);

    TableDataInfo<ProjectTargetVO> selectTargetList(ProjectTargetBO projectTargetBO, PageQuery pageQuery);

    /**
     * 根据项目id删除项目指标
     *
     * @param projectId
     *
     * @return int
     */
    int deleteTargetByProjectId(Long projectId);

    /**
     * 根据指标id列表删除项目指标
     *
     * @param targetIdList
     */
    void deleteProjectTargetByTargetIdList(List<Long> targetIdList);

    /**
     * 删除项目指标
     *
     * @param targetId
     *
     * @return int
     */
    int deleteProjectTarget(Long targetId);

    /**
     * 更新项目指标
     *
     * @param projectTargetBoList
     * @param projectId
     */
    void updateProjectTargetList(List<ProjectTargetBO> projectTargetBoList, Long projectId);

}
