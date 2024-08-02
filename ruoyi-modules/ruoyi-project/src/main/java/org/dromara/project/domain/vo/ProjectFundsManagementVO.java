package org.dromara.project.domain.vo;

import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.common.core.enums.ProjectLevelEnum;
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
    private String assignedSubjectName;
    /**
     * 负责课题
     */
    private String assignedSubjectSection;
    /**
     * 项目级别，0国家级，1省级，2企业级
     */
    private ProjectLevelEnum projectLevel;

    /**
     * 项目经费总额
     */
    private BigDecimal totalFundsAll;

    /**
     * 专项经费总额
     */
    private BigDecimal totalFundsZx;
    /**
     * 自筹经费总额
     */
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
    private BigDecimal totalFundsZxPaid;

    /**
     * 专项经费总额_未支付
     */
    private BigDecimal totalFundsZxUnpaid;

    /**
     * 自筹经费总额_已支付
     */
    private BigDecimal totalFundsZcPaid;

    /**
     * 自筹经费总额_未支付
     */
    private BigDecimal totalFundsZcUnpaid;
}
