package org.dromara.project.controller.ip;

import cn.dev33.satoken.annotation.SaCheckPermission;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.NotNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.bo.IntellectualPropertyBO;
import org.dromara.project.domain.vo.IntellectualPropertyDetailVO;
import org.dromara.project.domain.vo.IntellectualPropertyVO;
import org.dromara.project.service.IntellectualPropertyService;
import org.dromara.project.service.ProjectBaseInfoService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 知识产权
 *
 * @author bailingnan
 * @date 2024/02/06
 */
@Slf4j
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/ip")
public class IntellectualPropertyController {
    private final ProjectBaseInfoService projectBaseInfoService;
    private final IntellectualPropertyService intellectualPropertyService;

    /**
     * 添加知识产权 POST /add 接口路径 请求参数需满足 AddGroup 验证规则
     *
     * @param intellectualPropertyBO 知识产权实体对象
     *
     * @return 成功返回 R<Void>
     */
    @SaCheckPermission("project:ip:add")
    @Log(title = "新增知识产权信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public R<Void> addIntellectualProperty(
        @RequestBody @Validated(AddGroup.class) IntellectualPropertyBO intellectualPropertyBO) {
        intellectualPropertyService.insertIntellectualProperty(intellectualPropertyBO);
        return R.ok();
    }

    /**
     * 删除知识产权
     *
     * @param ipId 知识产权ID
     *
     * @return 操作结果
     */
    @SaCheckPermission("project:ip:delete")
    @Log(title = "删除知识产权信息", businessType = BusinessType.DELETE)
    @GetMapping("/delete")
    public R<Void> deleteIntellectualProperty(@RequestParam @NotNull Long ipId) {
        intellectualPropertyService.deleteIntellectualProperty(ipId);
        return R.ok();
    }

    /**
     * 更新知识产权
     *
     * @param intellectualPropertyBO 知识产权BO对象
     *
     * @return 更新结果
     */
    @SaCheckPermission("project:ip:update")
    @Log(title = "修改知识产权信息", businessType = BusinessType.UPDATE)
    @PostMapping("/update")
    public R<Void> updateIntellectualProperty(
        @RequestBody @Validated(EditGroup.class) IntellectualPropertyBO intellectualPropertyBO) {
        intellectualPropertyService.updateIntellectualProperty(intellectualPropertyBO);
        return R.ok();
    }

    /**
     * 获取知识产权详情
     *
     * @param ipId 知识产权ID
     *
     * @return 返回知识产权详情对象
     */
    @SaCheckPermission("project:ip:getDetails")
    @GetMapping("/getDetails")
    public R<IntellectualPropertyDetailVO> getIntellectualPropertyDetails(@RequestParam @NotNull Long ipId) {
        return R.ok(intellectualPropertyService.getIntellectualPropertyDetail(ipId));
    }

    /**
     * 查询知识产权列表
     *
     * @param intellectualPropertyBO 查询条件
     * @param pageQuery              分页查询参数
     *
     * @return 查询结果的TableDataInfo对象
     */
    @SaCheckPermission("project:ip:list")
    @PostMapping("/list")
    public TableDataInfo<IntellectualPropertyVO> queryIntellectualPropertVOList(
        @RequestBody @Validated(QueryGroup.class) IntellectualPropertyBO intellectualPropertyBO, PageQuery pageQuery) {
        return intellectualPropertyService.queryIntellectualPropertVOList(intellectualPropertyBO, pageQuery);
    }

    /**
     * 知识产权列表导出
     *
     * @param intellectualPropertyBO
     * @param response
     */
    @Log(title = "知识产权列表导出", businessType = BusinessType.EXPORT)
    @SaCheckPermission("project:ip:export")
    @PostMapping("/export")
    public void export(@Validated(QueryGroup.class) IntellectualPropertyBO intellectualPropertyBO,
        HttpServletResponse response) {
        List<IntellectualPropertyVO> intellectualPropertyVOList =
            intellectualPropertyService.queryIntellectualPropertVOList(intellectualPropertyBO);
        ExcelUtil.exportExcel(intellectualPropertyVOList, "知识产权数据", IntellectualPropertyVO.class, response);
    }

    /**
     * 知识产权管理获取项目ID和名称映射关系
     *
     * @return 映射关系列表
     */
    //@SaCheckPermission("ip:getProjectMapping")
    @GetMapping("/getProjectMapping")
    public R<List<Map<String, Object>>> getProjectIdAndNameMapping() {
        return R.ok(projectBaseInfoService.getProjectIdAndNameMapping());
    }

    /**
     * 获取项目树结构 项目类型->项目名
     *
     * @return {@link R}<{@link List}<{@link Map}<{@link String}, {@link Object}>>>
     */
    //@SaCheckPermission("ip:getProjectTree")
    @GetMapping("/getProjectTree")
    public R<List<Map<String, Object>>> getProjectTreeMapping() {
        return R.ok(projectBaseInfoService.getProjectTreeMapping());
    }

}
