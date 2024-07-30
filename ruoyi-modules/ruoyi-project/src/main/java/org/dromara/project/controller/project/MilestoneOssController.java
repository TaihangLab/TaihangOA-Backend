package org.dromara.project.controller.project;

import cn.dev33.satoken.annotation.SaCheckPermission;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.bo.ProjectMilestoneBo;
import org.dromara.project.service.ProjectMilestoneService;
import org.dromara.system.domain.vo.SysOssVo;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 项目附件管理（大事记文件）
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/milestone/oss")
public class MilestoneOssController {

    private final ProjectMilestoneService projectMilestoneService;

    /**
     * 分页查询项目附件列表
     *
     * @param projectMilestoneBo
     * @param pageQuery
     *
     * @return {@link TableDataInfo}<{@link SysOssVo}>
     */
    @SaCheckPermission("project:user:getAllList")
    @PostMapping("/getAllList")
    public TableDataInfo<SysOssVo> getAllProjectList(
        @RequestBody @Validated(QueryGroup.class) ProjectMilestoneBo projectMilestoneBo, PageQuery pageQuery) {
        return projectMilestoneService.queryPageAllList(projectMilestoneBo, pageQuery);
    }
}

