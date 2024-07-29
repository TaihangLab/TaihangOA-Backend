package org.dromara.project.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.utils.DateUtils;
import org.dromara.project.domain.ProjectPlan;
import org.dromara.project.domain.bo.ProjectPlanBO;
import org.dromara.project.domain.vo.ProjectPlanVO;
import org.dromara.project.mapper.ProjectPlanMapper;
import org.dromara.project.service.projectPlanService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 项目计划
 *
 * @author bailingnan
 * @date 2023/12/21
 */
@Service
@RequiredArgsConstructor
public class ProjectPlanServiceImpl implements projectPlanService {
    private final ProjectPlanMapper projectPlanMapper;

    /**
     * @param projectId
     *
     * @return
     */
    @Override
    public List<ProjectPlanVO> selectProjectPlanVOListByProjectId(Long projectId) {
        List<ProjectPlan> projectPlanList = projectPlanMapper.selectList(
            new LambdaQueryWrapper<ProjectPlan>().eq(ProjectPlan::getProjectId, projectId)
                .orderByAsc(ProjectPlan::getStageStartDate).orderByAsc(ProjectPlan::getStageEndDate));
        return projectPlanList.stream().map(projectPlan -> {
            ProjectPlanVO projectPlanVO = new ProjectPlanVO();
            projectPlanVO.setStageStartDate(DateUtils.localDateToYearMonth(projectPlan.getStageStartDate()));
            projectPlanVO.setStageEndDate(DateUtils.localDateToYearMonth(projectPlan.getStageEndDate()));
            projectPlanVO.setStageTask(projectPlan.getStageTask());
            return projectPlanVO;
        }).collect(Collectors.toList());
    }

    /**
     * @param projectPlanBOList
     */
    @Override
    public void insertProjectPlanList(List<ProjectPlanBO> projectPlanBOList, Long projectId) {
        if (projectPlanBOList == null || projectPlanBOList.isEmpty()) {
            return;
        }
        List<ProjectPlan> projectPlanList =
            projectPlanBOList.stream().map(bo -> projectPlanConverter(bo, projectId)).collect(Collectors.toList());
        projectPlanMapper.insertBatch(projectPlanList);
    }

    /**
     * @param projectPlanList
     */
    @Override
    public void insertProjectPlanList(List<ProjectPlan> projectPlanList) {
        if (projectPlanList == null || projectPlanList.isEmpty()) {
            return;
        }
        projectPlanMapper.insertBatch(projectPlanList);

    }

    /**
     * @param projectId
     */
    @Override
    public void deleteProjectPlanByProjectId(Long projectId) {
        projectPlanMapper.delete(new LambdaQueryWrapper<ProjectPlan>().eq(ProjectPlan::getProjectId, projectId));
    }

    /**
     * @param stageIdList
     */
    @Override
    public void deleteProjectPlanByStageIdList(List<Long> stageIdList) {
        projectPlanMapper.delete(new LambdaQueryWrapper<ProjectPlan>().in(ProjectPlan::getStageId, stageIdList));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateProjectPlanList(List<ProjectPlanBO> projectPlanBOList, Long projectId) {
        deleteProjectPlanByProjectId(projectId);
        insertProjectPlanList(projectPlanBOList, projectId);
    }

    private ProjectPlan projectPlanConverter(ProjectPlanBO bo, Long projectId) {
        ProjectPlan projectPlan = new ProjectPlan();
        BeanUtils.copyProperties(bo, projectPlan);
        projectPlan.setProjectId(projectId);
        Optional.ofNullable(bo.getStageStartDate())
            .ifPresent(date -> projectPlan.setStageStartDate(DateUtils.yearMonthToLocalDate(date)));
        Optional.ofNullable(bo.getStageEndDate())
            .ifPresent(endDate -> projectPlan.setStageEndDate(DateUtils.yearMonthToLocalDate(endDate)));
        return projectPlan;
    }
}
