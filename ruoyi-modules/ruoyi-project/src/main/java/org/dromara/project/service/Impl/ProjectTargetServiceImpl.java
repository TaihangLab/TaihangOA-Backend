package org.dromara.project.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.ProjectTarget;
import org.dromara.project.domain.bo.ProjectTargetBO;
import org.dromara.project.domain.vo.ProjectTargetVO;
import org.dromara.project.mapper.ProjectTargetMapper;
import org.dromara.project.mapper.ProjectTargetProgressMapper;
import org.dromara.project.service.ProjectTargetService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 项目指标
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class ProjectTargetServiceImpl implements ProjectTargetService {

    private final ProjectTargetMapper projectTargetMapper;

    private final ProjectTargetProgressMapper projectTargetProgressMapper;

    /**
     * 新增多个项目指标
     *
     * @param projectTargets 项目指标信息列表
     *
     * @return 结果
     */
    @Override
    public boolean insertProjectTargetList(List<ProjectTarget> projectTargets) {
        if (projectTargets.isEmpty()) {
            return false;
        }
        return projectTargetMapper.insertBatch(projectTargets);
    }

    /**
     * @param projectTargetBOList
     * @param projectId
     */
    @Override
    public void insertProjectTargetList(List<ProjectTargetBO> projectTargetBOList, Long projectId) {
        if (projectTargetBOList == null || projectTargetBOList.isEmpty()) {
            return;
        }
        List<ProjectTarget> projectTargetList = projectTargetBOList.stream().map(bo -> {
            ProjectTarget projectTarget = new ProjectTarget();
            BeanUtil.copyProperties(bo, projectTarget);
            projectTarget.setProjectId(projectId);
            return projectTarget;
        }).collect(Collectors.toList());
        insertProjectTargetList(projectTargetList);
    }

    /**
     * 查询某一项目对应的项目指标
     *
     * @param projectId 项目ID
     *
     * @return 结果
     */
    @Override
    public List<ProjectTargetVO> selectTargetListByProjectId(Long projectId) {
        return projectTargetMapper.selectVoList(
            new LambdaQueryWrapper<ProjectTarget>().eq(ProjectTarget::getProjectId, projectId));
    }

    @Override
    public TableDataInfo<ProjectTargetVO> selectTargetList(ProjectTargetBO projectTargetBO, PageQuery pageQuery) {
        if (projectTargetBO == null) {
            throw new IllegalArgumentException("projectTargetBO cannot be null");
        }
        Long projectId = projectTargetBO.getProjectId();
        LambdaQueryWrapper<ProjectTarget> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(projectId != null, ProjectTarget::getProjectId, projectId);
        queryWrapper.like(projectTargetBO.getTargetName() != null, ProjectTarget::getTargetName,
            projectTargetBO.getTargetName());
        Page<ProjectTargetVO> result = projectTargetMapper.selectVoPage(pageQuery.build(), queryWrapper);
        return TableDataInfo.build(result);
    }

    /**
     * 删除某一项目对应的全部项目指标
     *
     * @param projectId 项目ID
     *
     * @return 结果
     */
    @Override
    public int deleteTargetByProjectId(Long projectId) {
        return projectTargetMapper.delete(
            new LambdaQueryWrapper<ProjectTarget>().eq(ProjectTarget::getProjectId, projectId));
    }

    /**
     * @param targetIdList
     */
    @Override
    public void deleteProjectTargetByTargetIdList(List<Long> targetIdList) {
        if (targetIdList == null || targetIdList.isEmpty()) {
            return;
        }
        projectTargetMapper.delete(
            new LambdaQueryWrapper<ProjectTarget>().in(ProjectTarget::getTargetId, targetIdList));

    }

    /**
     * 删除单条目指标
     *
     * @param targetId 项目指标ID
     *
     * @return 结果
     */
    @Override
    public int deleteProjectTarget(Long targetId) {
        return projectTargetMapper.delete(
            new LambdaQueryWrapper<ProjectTarget>().eq(ProjectTarget::getTargetId, targetId));
    }

    /**
     * @param projectTargetBoList
     * @param projectId
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateProjectTargetList(List<ProjectTargetBO> projectTargetBoList, Long projectId) {
        deleteTargetByProjectId(projectId);
        insertProjectTargetList(projectTargetBoList, projectId);
    }

}
