package org.dromara.project.service;

import org.dromara.common.core.enums.ProjectMilestoneTypeEnum;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.bo.ProjectMilestoneBo;
import org.dromara.project.domain.vo.ProjectMilestoneVo;
import org.dromara.system.domain.vo.SysOssVo;

import java.util.List;
import java.util.Set;

/**
 * 项目大事记Service接口
 *
 * @author bailingnan
 * @date 2024/02/06
 */
public interface ProjectMilestoneService {
    /**
     * 新增项目大事记
     *
     * @param projectMilestoneBo
     *
     * @return int
     */
    int insertProjectMilestone(ProjectMilestoneBo projectMilestoneBo);

    /**
     * 通过projectId删除项目大事记
     *
     * @param projectId
     *
     * @return int
     */
    int deleteMilestoneByProjectId(Long projectId);

    /**
     * 通过milestoneId删除项目大事记
     *
     * @param milestoneId
     *
     * @return int
     */
    int deleteProjectMilestone(Long milestoneId);

    /**
     * 更新项目大事记
     *
     * @param projectMilestoneBo
     *
     * @return int
     */
    int updateMilestone(ProjectMilestoneBo projectMilestoneBo);

    /**
     * 获取大事记列表
     *
     * @param projectMilestoneBo
     *
     * @return {@link List}<{@link ProjectMilestoneVo}>
     */
    List<ProjectMilestoneVo> queryMilestoneList(ProjectMilestoneBo projectMilestoneBo);

    /**
     * 获取大事记列表
     *
     * @param projectMilestoneBo
     * @param pageQuery
     *
     * @return {@link TableDataInfo}<{@link SysOssVo}>
     */
    TableDataInfo<SysOssVo> queryPageAllList(ProjectMilestoneBo projectMilestoneBo, PageQuery pageQuery);

    /**
     * 查询所有大事记分类
     */
    List<ProjectMilestoneTypeEnum> selectCategoryAll();

    /**
     * 根据项目id查询大事记分类列表
     */
    Set<ProjectMilestoneTypeEnum> getCategoryEnumsByProjectId(Long projectId);
}
