package org.dromara.project.controller.project;

import cn.dev33.satoken.annotation.SaCheckPermission;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.project.domain.bo.ProjectTargetBO;
import org.dromara.project.domain.vo.ProjectTargetVO;
import org.dromara.project.service.ProjectTargetService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
