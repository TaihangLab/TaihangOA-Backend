package org.dromara.project.controller.project;

import cn.dev33.satoken.annotation.SaCheckPermission;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.project.domain.bo.ProjectTargetBO;
import org.dromara.project.domain.bo.ProjectTargetProgressBO;
import org.dromara.project.domain.vo.ProjectTargetProgressVO;
import org.dromara.project.domain.vo.ProjectTargetVO;
import org.dromara.project.service.ProjectTargetService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 项目指标
 *
 * @author bailingnan
 * @date 2024/8/28
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/project/target")
public class ProjectTargetController extends BaseController {
    private final ProjectTargetService projectTargetService;

    /**
     * 查询某个项目下的指标
     *
     * @param projectTargetBO
     * @param pageQuery
     *
     * @return {@link TableDataInfo }<{@link ProjectTargetVO }>
     */
    @SaCheckPermission("project:target:all")
    @PostMapping("/all")
    public TableDataInfo<ProjectTargetVO> getAllProjectTargetList(
        @RequestBody @Validated(QueryGroup.class) ProjectTargetBO projectTargetBO, PageQuery pageQuery) {
        return projectTargetService.selectTargetList(projectTargetBO, pageQuery);
    }

    /**
     * 某项目添加指标
     *
     * @param projectTargetBO
     */
    @SaCheckPermission("project:target:add")
    @PostMapping("/add")
    public R<Void> addProjectTarget(@RequestBody @Validated(AddGroup.class) ProjectTargetBO projectTargetBO) {
        projectTargetService.insertProjectTarget(projectTargetBO);
        return R.ok();
    }

    /**
     * 删除项目指标
     *
     * @param targetId
     */
    @SaCheckPermission("project:target:delete")
    @GetMapping("/delete")
    public R<Void> deleteProjectTarget(@RequestParam @NotNull Long targetId) {
        projectTargetService.deleteProjectTarget(targetId);
        return R.ok();
    }

    /**
     * 更新项目指标
     *
     * @param projectTargetBO
     */
    @SaCheckPermission("project:target:update")
    @PostMapping("/update")
    public R<Void> updateProjectTarget(@RequestBody @Validated(AddGroup.class) ProjectTargetBO projectTargetBO) {
        projectTargetService.updateProjectTarget(projectTargetBO);
        return R.ok();
    }

    /**
     * 查询某指标全部进度
     *
     * @param projectTargetProgressBO
     * @param pageQuery
     *
     * @return {@link TableDataInfo }<{@link ProjectTargetProgressVO }>
     */
    @SaCheckPermission("project:target:detail")
    @GetMapping("/detail")
    public TableDataInfo<ProjectTargetProgressVO> getProjectTargetDetail(
        @RequestBody @Validated(QueryGroup.class) ProjectTargetProgressBO projectTargetProgressBO,
        PageQuery pageQuery) {
        return projectTargetService.selectTargetProgressList(projectTargetProgressBO, pageQuery);
    }

    /**
     * 新增指标进度
     *
     * @param projectTargetProgressBO
     *
     * @return {@link R }<{@link Void }>
     */
    @SaCheckPermission("project:target:addProgress")
    @PostMapping("/addProgress")
    public R<Void> addProjectTargetProgress(
        @RequestBody @Validated(AddGroup.class) ProjectTargetProgressBO projectTargetProgressBO) {
        projectTargetService.insertProjectTargetProgress(projectTargetProgressBO);
        return R.ok();
    }

    /**
     * 删除指标进度
     *
     * @param progressId
     */
    @SaCheckPermission("project:target:deleteProgress")
    @PostMapping("/deleteProgress")
    public R<Void> deleteProjectTargetProgress(@RequestParam @NotNull Long progressId) {
        projectTargetService.deleteProjectProgressByProgressId(progressId);
        return R.ok();
    }

    /**
     * 更新指标进度
     *
     * @param projectTargetProgressBO
     */
    @SaCheckPermission("project:target:updateProgress")
    @PostMapping("/updateProgress")
    public R<Void> updateProjectTargetProgress(
        @RequestBody @Validated(EditGroup.class) ProjectTargetProgressBO projectTargetProgressBO) {
        projectTargetService.updateProjectTargetProgressById(projectTargetProgressBO);
        return R.ok();
    }

}
