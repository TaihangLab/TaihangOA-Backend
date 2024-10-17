package org.dromara.project.controller.project;

import cn.dev33.satoken.annotation.SaCheckPermission;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.bo.ProjectUserBo;
import org.dromara.project.domain.vo.ProjectUserDetailVo;
import org.dromara.project.domain.vo.ProjectUserVo;
import org.dromara.project.service.ProjectUserService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 项目用户管理
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/project/user")
public class ProjectUserController {

    private final ProjectUserService projectUserService;

    /**
     * 获取全部用户列表
     *
     * @param projectUserBo 成员基本信息
     * @param pageQuery     分页信息
     *
     * @return {@link TableDataInfo}<{@link ProjectUserVo}>
     */
    @SaCheckPermission("project:user:getAllList")
    @PostMapping("/getAllList")
    public TableDataInfo<ProjectUserVo> getAllProjectList(
        @RequestBody @Validated(QueryGroup.class) ProjectUserBo projectUserBo, PageQuery pageQuery) {
        return projectUserService.queryPageAllList(projectUserBo, pageQuery);
    }

    /**
     * 项目成员列表导出
     *
     * @param projectUserBo
     * @param response
     */
    @Log(title = "项目成员列表导出", businessType = BusinessType.EXPORT)
    @SaCheckPermission("project:user:export")
    @PostMapping("/exportData")
    public void export(@RequestBody @Validated(QueryGroup.class) ProjectUserBo projectUserBo,
        HttpServletResponse response) {
        List<ProjectUserVo> list = projectUserService.queryAllList(projectUserBo);
        ExcelUtil.exportExcel(list, "项目成员数据", ProjectUserVo.class, response);
    }


    /**
     * 根据userId查询对应的不同类型的项目详情
     *
     * @param userId
     *
     * @return {@link R}<{@link ProjectUserDetailVo}>
     */
    @SaCheckPermission("project:user:getDetails")
    @GetMapping("/getDetails")
    public R<ProjectUserDetailVo> getProjectUserDetailVo(@RequestParam @NotNull Long userId) {
        return R.ok(projectUserService.getProjectUserDetailById(userId));
    }
}
