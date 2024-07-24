package org.dromara.project.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.dromara.common.core.constant.DateConstants;

import java.time.YearMonth;

/**
 * 项目计划VO
 *
 * @author bailingnan
 * @date 2023/12/21
 */
@Data
public class ProjectPlanVO {
    /**
     * 阶段开始日期
     */
    @JsonFormat(pattern = DateConstants.YYYY_MM)
    private YearMonth stageStartDate;

    /**
     * 阶段结束日期
     */
    @JsonFormat(pattern = DateConstants.YYYY_MM)
    private YearMonth stageEndDate;

    /**
     * 阶段任务
     */
    private String stageTask;
}
