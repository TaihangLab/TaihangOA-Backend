package org.dromara.project.service.Impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.ProjectTarget;
import org.dromara.project.domain.ProjectTargetProgress;
import org.dromara.project.domain.bo.ProjectTargetBO;
import org.dromara.project.domain.bo.ProjectTargetProgressBO;
import org.dromara.project.domain.vo.ProjectTargetProgressVO;
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

    @Override
    public void insertProjectTarget(ProjectTargetBO projectTargetBO) {
        if (projectTargetBO == null) {
            throw new IllegalArgumentException("projectTargetBO cannot be null");
        }
        ProjectTarget projectTarget = new ProjectTarget();
        BeanUtil.copyProperties(projectTargetBO, projectTarget);
        projectTargetMapper.insert(projectTarget);
    }

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
    public void deleteTargetByProjectId(Long projectId) {
        projectTargetMapper.delete(
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
    public void deleteProjectTarget(Long targetId) {
        if (projectTargetMapper.delete(
            new LambdaQueryWrapper<ProjectTarget>().eq(ProjectTarget::getTargetId, targetId)) != 1) {
            throw new IllegalStateException("delete project target failed");
        }
    }

    /**
     * 批量更新项目指标
     *
     * @param projectTargetBoList
     * @param projectId
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateProjectTargetList(List<ProjectTargetBO> projectTargetBoList, Long projectId) {
        deleteTargetByProjectId(projectId);
        insertProjectTargetList(projectTargetBoList, projectId);
    }

    @Override
    public void updateProjectTarget(ProjectTargetBO projectTargetBO) {
        if (projectTargetBO == null) {
            throw new IllegalArgumentException("projectTargetBO cannot be null");
        }
        ProjectTarget projectTarget = new ProjectTarget();
        BeanUtil.copyProperties(projectTargetBO, projectTarget);
        if (projectTargetMapper.updateById(projectTarget) != 1) {
            throw new IllegalStateException("update project target failed");
        }
    }

    @Override
    public TableDataInfo<ProjectTargetProgressVO> selectTargetProgressList(
        ProjectTargetProgressBO projectTargetProgressBO, PageQuery pageQuery) {
        if (projectTargetProgressBO == null) {
            throw new IllegalArgumentException("projectTargetProgressBO cannot be null");
        }
        Long targetId = projectTargetProgressBO.getTargetId();
        LambdaQueryWrapper<ProjectTargetProgress> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(targetId != null, ProjectTargetProgress::getTargetId, targetId);
        queryWrapper.like(StrUtil.isNotBlank(projectTargetProgressBO.getCompletionStatus()),
            ProjectTargetProgress::getCompletionStatus, projectTargetProgressBO.getCompletionStatus());
        queryWrapper.like(StrUtil.isNotBlank(projectTargetProgressBO.getDetailedDescription()),
            ProjectTargetProgress::getDetailedDescription, projectTargetProgressBO.getDetailedDescription());
        queryWrapper.ge(projectTargetProgressBO.getCompletionTimeSta() != null,
            ProjectTargetProgress::getCompletionTime, projectTargetProgressBO.getCompletionTimeSta());
        queryWrapper.le(projectTargetProgressBO.getCompletionTimeEnd() != null,
            ProjectTargetProgress::getCompletionTime, projectTargetProgressBO.getCompletionTimeEnd());
        queryWrapper.orderByDesc(ProjectTargetProgress::getCompletionTime);
        Page<ProjectTargetProgressVO> result =
            projectTargetProgressMapper.selectVoPage(pageQuery.build(), queryWrapper);
        return TableDataInfo.build(result);
    }

    @Override
    public void insertProjectTargetProgress(ProjectTargetProgressBO projectTargetProgressBO) {
        if (projectTargetProgressBO == null) {
            throw new IllegalArgumentException("projectTargetProgressBO cannot be null");
        }
        ProjectTargetProgress projectTargetProgress = new ProjectTargetProgress();
        BeanUtil.copyProperties(projectTargetProgressBO, projectTargetProgress);
        if (projectTargetProgressMapper.insert(projectTargetProgress) != 1) {
            throw new IllegalStateException("insert project target progress failed");
        }
    }

    @Override
    public void deleteProjectProgressByProgressId(Long progressId) {
        if (projectTargetProgressMapper.delete(
            new LambdaQueryWrapper<ProjectTargetProgress>().eq(ProjectTargetProgress::getProgressId,
                progressId)) != 1) {
            throw new IllegalStateException("delete project progress failed");
        }
    }

    @Override
    public void updateProjectTargetProgressById(ProjectTargetProgressBO projectTargetProgressBO) {
        if (projectTargetProgressBO == null) {
            throw new IllegalArgumentException("projectTargetProgressBO cannot be null");
        }
        if (projectTargetProgressBO.getProgressId() == null) {
            throw new IllegalArgumentException("progressId cannot be null");
        }
        ProjectTargetProgress projectTargetProgress = new ProjectTargetProgress();
        BeanUtil.copyProperties(projectTargetProgressBO, projectTargetProgress);
        if (projectTargetProgressMapper.updateById(projectTargetProgress) != 1) {
            throw new IllegalStateException("update project target progress failed");
        }
    }

}
