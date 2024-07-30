package org.dromara.project.controller.project;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.bean.BeanUtil;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.common.excel.core.ExcelResult;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.ProjectExpenditure;
import org.dromara.project.domain.ProjectFundsReceived;
import org.dromara.project.domain.bo.ProjectBaseInfoBO;
import org.dromara.project.domain.bo.ProjectExpenditureBO;
import org.dromara.project.domain.vo.*;
import org.dromara.project.listener.ProjectFundsImportListener;
import org.dromara.project.service.ProjectExpenditureService;
import org.dromara.project.service.ProjectFundsManagementService;
import org.dromara.project.service.ProjectFundsReceivedService;
import org.dromara.project.service.ProjectFundsService;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 项目经费
 *
 * @author bailingnan
 * @date 2024/2/26
 */
@Validated
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/project/funds")
public class ProjectFundsController {

    private final ProjectFundsReceivedService projectFundsReceivedService;
    private final ProjectFundsService projectFundsService;
    private final ProjectFundsManagementService projectFundsManagementService;
    private final ProjectExpenditureService projectExpenditureService;

    /**
     * 经费管理列表
     *
     * @param projectBaseInfoBO
     * @param pageQuery
     *
     * @return {@link TableDataInfo}<{@link ProjectFundsManagementVO}>
     */
    @SaCheckPermission("project:expense:getAllList")
    @PostMapping("/getProjectList")
    public TableDataInfo<ProjectFundsManagementVO> getProjectList(
        @RequestBody @Validated(QueryGroup.class) ProjectBaseInfoBO projectBaseInfoBO, PageQuery pageQuery) {
        return projectFundsManagementService.queryPageList(projectBaseInfoBO, pageQuery);
    }

    /**
     * 导入数据
     *
     * @param file 导入文件
     *
     * @return {@link R}<{@link List}<{@link ProjectExpenditureImportVO}>>
     *
     * @throws Exception
     */
    @Log(title = "经费支出导入", businessType = BusinessType.IMPORT)
    @SaCheckPermission("project:expense:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<List<ProjectExpenditureImportVO>> importData(@RequestPart("file") MultipartFile file) throws Exception {
        ExcelResult<ProjectExpenditureImportVO> result =
            ExcelUtil.importExcel(file.getInputStream(), ProjectExpenditureImportVO.class,
                new ProjectFundsImportListener());
        return R.ok(result.getList());
    }

    /**
     * 导出数据
     *
     * @param projectExpenditureBO 支出ID
     * @param response
     */
    @Log(title = "经费支出导出", businessType = BusinessType.EXPORT)
    @SaCheckPermission("project:expense:export")
    @PostMapping("/exportData")
    public void export(ProjectExpenditureBO projectExpenditureBO, HttpServletResponse response) {
        List<ProjectExpenditure> projectExpenditures =
            projectExpenditureService.getProjectExpenditureByProId(projectExpenditureBO);
        List<ProjectExpenditureExportVO> projectExpenditureExportVOS =
            BeanUtil.copyToList(projectExpenditures, ProjectExpenditureExportVO.class);
        ExcelUtil.exportExcel(projectExpenditureExportVOS, "支出明细数据", ProjectExpenditureExportVO.class, response);
    }

    /**
     * 新增支出记录
     *
     * @param projectExpenditureBOList
     *
     * @return {@link R}<{@link Void}>
     */
    @Log(title = "新增支出记录", businessType = BusinessType.INSERT)
    @SaCheckPermission("project:expense:add")
    @PostMapping(value = "/add")
    public R<Void> addProjectExpenditureList(
        @RequestBody @Validated(EditGroup.class) List<ProjectExpenditureBO> projectExpenditureBOList) {
        projectExpenditureService.addProjectExpenditureList(projectExpenditureBOList);
        return R.ok();
    }

    /**
     * 支出记录回滚
     *
     * @param expenditureId
     *
     * @return {@link R}<{@link Void}>
     *
     * @throws IllegalAccessException
     */
    @Log(title = "支出记录回滚", businessType = BusinessType.DELETE)
    @SaCheckPermission("project:expense:cancel")
    @GetMapping(value = "/rollback")
    public R<Void> rollBackProjectExpenditure(@RequestParam @NotNull Long expenditureId) throws IllegalAccessException {
        projectExpenditureService.rollBackProjectExpenditureById(expenditureId);
        return R.ok();
    }

    /**
     * 新增专项经费到账记录
     *
     * @param projectFundsReceived 经费到账信息
     *
     * @return
     */
    @Log(title = "新增专项经费到账记录", businessType = BusinessType.INSERT)
    @SaCheckPermission("project:expense:receivedAdd")
    @PostMapping(value = "/addFundsReceived")
    public R<Void> addProjectFundsReceived(
        @RequestBody @Validated(AddGroup.class) ProjectFundsReceived projectFundsReceived) {
        projectFundsReceivedService.addFundsReceived(projectFundsReceived);
        return R.ok();
    }

    /**
     * 修改专项经费到账记录
     *
     * @param projectFundsReceived 修改后的经费到账信息
     *
     * @return
     */
    @Log(title = "修改专项经费到账记录", businessType = BusinessType.UPDATE)
    @SaCheckPermission("project:expense:receivedEdit")
    @PostMapping(value = "/updateFundsReceived")
    public R<Void> updateFundsReceived(
        @RequestBody @Validated(AddGroup.class) ProjectFundsReceived projectFundsReceived) {
        projectFundsReceivedService.updateFundsReceived(projectFundsReceived);
        return R.ok();
    }

    /**
     * 删除专项经费到账记录
     *
     * @param receivedId 经费到账ID
     *
     * @return
     */
    @Log(title = "删除专项经费到账记录", businessType = BusinessType.DELETE)
    @SaCheckPermission("project:expense:receivedDelete")
    @GetMapping(value = "/deleteFundsReceived")
    public R<Void> deleteFundsReceivedById(@RequestParam @Validated(AddGroup.class) Long receivedId) {
        projectFundsReceivedService.deleteFundsReceivedById(receivedId);
        return R.ok();
    }

    /**
     * 查询某个项目的专项经费到账记录
     *
     * @param projectId 项目ID
     *
     * @return
     */
    @GetMapping(value = "/getFundsReceived")
    public R<List<ProjectFundsReceivedVo>> getFundsReceivedByProId(@RequestParam @NotNull Long projectId) {
        List<ProjectFundsReceivedVo> fundsReceivedVoList =
            projectFundsReceivedService.getFundsReceivedByProId(projectId);
        return R.ok(fundsReceivedVoList);
    }

    /**
     * 查询支出明细
     *
     * @param projectExpenditureBO
     *
     * @return {@link R }<{@link List }<{@link ProjectExpenditureVO }>>
     */
    @SaCheckPermission("project:expense:view")
    @PostMapping(value = "/getProjectExpenditure")
    public TableDataInfo<ProjectExpenditureVO> getProjectExpenditureListByProId(
        @RequestBody @Validated(QueryGroup.class) ProjectExpenditureBO projectExpenditureBO, PageQuery pageQuery) {
        return projectExpenditureService.getProjectExpenditureByProId(projectExpenditureBO, pageQuery);
    }
}
