package org.dromara.project.controller.project;

import cn.dev33.satoken.annotation.SaCheckPermission;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.enums.ProjectMilestoneTypeEnum;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.project.domain.bo.ProjectBaseInfoBO;
import org.dromara.project.domain.bo.ProjectMilestoneBo;
import org.dromara.project.domain.vo.ProjectBaseInfoVO;
import org.dromara.project.domain.vo.ProjectDetailsVO;
import org.dromara.project.domain.vo.ProjectMilestoneVo;
import org.dromara.project.service.ProjectBaseInfoService;
import org.dromara.project.service.ProjectMilestoneService;
import org.dromara.project.service.ProjectService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * 项目管理
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/project/list")
public class ProjectListController extends BaseController {

    private final ProjectMilestoneService projectMilestoneService;

    private final ProjectService projectService;

    private final ProjectBaseInfoService projectBaseInfoService;

    /**
     * 获取所有项目列表
     *
     * @param projectBaseInfoBO 项目基本信息
     * @param pageQuery         分页查询条件
     *
     * @return 所有项目列表
     */
    @SaCheckPermission("project:list:getAllList")
    @PostMapping("/getAllList")
    public TableDataInfo<ProjectBaseInfoVO> getAllProjectList(
        @RequestBody @Validated(QueryGroup.class) ProjectBaseInfoBO projectBaseInfoBO, PageQuery pageQuery) {
        return projectBaseInfoService.queryPageAllList(projectBaseInfoBO, pageQuery);
    }

    /**
     * 获取项目详情
     *
     * @param projectId 项目ID
     *
     * @return 返回项目详情对象
     */
    @SaCheckPermission("project:list:getDetails")
    @GetMapping("/getDetails")
    public R<ProjectDetailsVO> getProjectDetails(@RequestParam @NotNull Long projectId) {
        return R.ok(projectService.getProjectDetails(projectId));
    }

    /**
     * 根据项目id查询项目大事纪
     *
     * @param projectMilestoneBo
     *
     * @return 结果
     */
    @SaCheckPermission("project:list:queryMilestone")
    @PostMapping("/milestonequery")
    public R<List<ProjectMilestoneVo>> queryMilestone(@RequestBody ProjectMilestoneBo projectMilestoneBo) {
        return R.ok(projectMilestoneService.queryMilestoneList(projectMilestoneBo));
    }

    /**
     * 新增大事记时获取大事记分类选择框列表
     */
    @GetMapping("/milestoneCategorySelect")
    public R<List<ProjectMilestoneTypeEnum>> milestoneCategorySelect() {
        return R.ok(projectMilestoneService.selectCategoryAll());
    }

    /**
     * 根据项目id搜索大事记分类
     */
    @SaCheckPermission("project:list:milestoneCategorySelectSet")
    @GetMapping("/milestoneCategorySelectSet")
    public R<Set<ProjectMilestoneTypeEnum>> milestoneCategorySelectSet(@RequestParam @NotNull Long projectId) {
        return R.ok(projectMilestoneService.getCategoryEnumsByProjectId(projectId));
    }
}
