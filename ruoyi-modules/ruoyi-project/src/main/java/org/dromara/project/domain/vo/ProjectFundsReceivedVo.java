package org.dromara.project.domain.vo;

/**
 * @author bailingnan
 * @date 2024/7/24
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.project.domain.ProjectFundsReceived;
import org.dromara.system.domain.SysOss;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Data
@AutoMapper(target = ProjectFundsReceived.class)
public class ProjectFundsReceivedVo {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Long receivedId;

    /**
     * 项目ID
     */
    private Long projectId;

    /**
     * 大事记ID
     */
    private Long milestoneId;

    /**
     * 到账金额
     */
    private BigDecimal amountReceived;

    /**
     * 到账类型，0发票，1收据
     */
    private Integer receivedType;

    /**
     * 来款单位
     */
    private String receivedFrom;

    /**
     * Oss对象
     */
    private List<SysOss> sysOsses;

    /**
     * 到账日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate receivedDate;
}

