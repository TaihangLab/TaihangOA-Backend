package org.dromara.project.domain.bo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.dromara.common.core.constant.DateConstants;
import org.dromara.common.core.enums.*;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.core.validate.QueryGroup;
import org.dromara.project.domain.ProjectExpenditure;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

/**
 * 经费支出BO
 *
 * @author bailingnan
 * @date 2024/03/05
 */
@Data
@AutoMapper(target = ProjectExpenditure.class, reverseConvertGenerate = false)
public class ProjectExpenditureBO {
    /**
     * 支出id
     */
    @NotNull(message = "支出id不能为空", groups = {EditGroup.class})
    private Long expenditureId;

    /**
     * 支出id集合
     */
    private List<Long> expenditureIds;
    /**
     * 项目id
     */
    @NotNull(message = "项目id不能为空", groups = {QueryGroup.class})
    private Long projectId;
    /**
     * 支出日期
     */
    private LocalDate expenditureDate;
    /**
     * 项目名称
     */
    private String projectName;
    /**
     * 凭证号
     */
    private String voucherNo;
    /**
     * 摘要
     */
    private String expenditureAbstract;
    /**
     * 专项/自筹,0专项,1自筹
     */
    private ZxZcEnum zxzc;
    /**
     * 直接/间接
     */
    private ZjJjEnum zjjj;
    /**
     * 一级科目
     */
    private FirstLevelSubjectEnum firstLevelSubject;
    /**
     * 二级科目
     */
    private SecondLevelSubjectEnum secondLevelSubject;
    /**
     * 三级科目
     */
    private ThirdLevelSubjectEnum thirdLevelSubject;
    /**
     * 支出金额
     */
    private BigDecimal amount;
    /**
     * 支出日期开始查询时间
     */
    @JsonFormat(pattern = DateConstants.YYYY_MM_DD)
    private LocalDate expenditureDateSta;

    /**
     * 支出日期结束查询时间
     */
    @JsonFormat(pattern = DateConstants.YYYY_MM_DD)
    private LocalDate expenditureDateEnd;
}
