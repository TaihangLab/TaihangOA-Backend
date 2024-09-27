package org.dromara.project.controller.project;

import cn.dev33.satoken.annotation.SaCheckPermission;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.dromara.common.core.domain.R;
import org.dromara.project.domain.vo.ProjectFundsAndBalanceVO;
import org.dromara.project.service.ProjectBalanceService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 项目余额
 *
 * @author bailingnan
 * @date 2024/3/6 10:06
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/project/balance")
public class ProjectBalanceController {

    private final ProjectBalanceService projectBalanceService;

    /**
     * 根据项目ID查询项目经费预算和支出明细及汇总
     *
     * @param projectId 项目ID
     *
     * @return
     */
    @GetMapping(value = "/fundsAndBalance")
    @SaCheckPermission("project:expense:fundsAndBalance")
    public R<ProjectFundsAndBalanceVO> getFundsAndBalanceByProjectId(@RequestParam @NonNull Long projectId) {
        ProjectFundsAndBalanceVO fundsAndBalance = projectBalanceService.getFundsAndBalanceByProjectId(projectId);
        return R.ok(fundsAndBalance);
    }
}
