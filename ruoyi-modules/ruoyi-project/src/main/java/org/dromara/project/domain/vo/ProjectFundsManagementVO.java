package org.dromara.project.domain.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.common.core.enums.ProjectLevelEnum;
import org.dromara.common.excel.annotation.ExcelEnumFormat;
import org.dromara.common.excel.convert.ExcelEnumConvert;
import org.dromara.project.domain.ProjectBaseInfo;

import java.math.BigDecimal;

/**
 * 项目经费管理VO
 *
 * @author bailingnan
 * @date 2024/03/01
 */
@Data
@AutoMapper(target = ProjectBaseInfo.class)
public class ProjectFundsManagementVO {
    /**
     * 项目id
     */
    private Long projectId;
    /**
     * 承担课题名称
     */
    @ExcelProperty(value = "项目名称")
    private String assignedSubjectName;
    /**
     * 负责课题
     */
    @ExcelProperty(value = "课题名称")
    private String assignedSubjectSection;
    /**
     * 项目级别，0国家级，1省级，2企业级
     */
    @ExcelProperty(value = "项目级别", converter = ExcelEnumConvert.class)
    @ExcelEnumFormat(enumClass = ProjectLevelEnum.class, codeField = "value", textField = "description")
    private ProjectLevelEnum projectLevel;

    /**
     * 项目经费总额
     */
    @ExcelProperty(value = "项目经费总额(万元)")
    private BigDecimal totalFundsAll;

    /**
     * 专项经费总额
     */
    @ExcelProperty(value = "专项经费预算(万元)")
    private BigDecimal totalFundsZx;
    /**
     * 自筹经费总额
     */
    @ExcelProperty(value = "自筹经费预算(万元)")
    private BigDecimal totalFundsZc;
    /**
     * 项目经费总额_已支付
     */
    private BigDecimal totalFundsAllPaid;

    /**
     * 项目经费总额_未支付
     */
    private BigDecimal totalFundsAllUnpaid;

    /**
     * 专项经费总额_已支付
     */
    @ExcelProperty(value = "专项经费已支付(万元)")
    private BigDecimal totalFundsZxPaid;

    /**
     * 专项经费总额_未支付
     */
    @ExcelProperty(value = "专项经费未支付(万元)")
    private BigDecimal totalFundsZxUnpaid;

    /**
     * 自筹经费总额_已支付
     */
    @ExcelProperty(value = "自筹经费已支付(万元)")
    private BigDecimal totalFundsZcPaid;

    /**
     * 自筹经费总额_未支付
     */
    @ExcelProperty(value = "自筹经费未支付(万元)")
    private BigDecimal totalFundsZcUnpaid;
}
