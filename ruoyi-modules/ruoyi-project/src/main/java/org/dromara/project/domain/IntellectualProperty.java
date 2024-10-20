package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.dromara.common.core.enums.IntellectualPropertyStatusEnum;
import org.dromara.common.core.enums.IntellectualPropertyTypeEnum;
import org.dromara.common.tenant.core.TenantEntity;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;

/**
 * 知识产权表
 *
 * @author bailingnan
 * @TableName intellectual_property
 * @date 2024/02/06
 */
@EqualsAndHashCode(callSuper = false)
@TableName(value = "intellectual_property")
@Data
public class IntellectualProperty extends TenantEntity implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
    /**
     * 知识产权id
     */
    @TableId(type = IdType.AUTO)
    private Long ipId;
    /**
     * 项目id
     */
    private Long projectId;
    /**
     * 知识产权名
     */
    @NotBlank(message = "知识产权名称不能为空")
    private String ipName;
    /**
     * 知识产权类别,国内发明专利0、软件著作权1、论文2、标准3
     */
    private IntellectualPropertyTypeEnum ipType;
    /**
     * 知识产权状态,专利受理0，专利授权1，软著已获取2，标准正在申报3，标准已通过4，论文已发表5
     */
    private IntellectualPropertyStatusEnum ipStatus;
    /**
     * 获得日期
     */
    private LocalDate ipDate;
    /**
     * 大事记id
     */
    private Long milestoneId;
    /**
     * 是否删除
     */
    @TableLogic
    @TableField(select = false)
    private Integer deleted;
}
