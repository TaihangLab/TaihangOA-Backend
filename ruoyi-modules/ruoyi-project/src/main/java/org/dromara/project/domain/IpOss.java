package org.dromara.project.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.io.Serializable;

/**
 * 知识产权和存储对象关联表
 *
 * @author bailingnan
 * @TableName ip_oss
 * @date 2024/02/06
 */
@Data
@EqualsAndHashCode(of = {"ipId", "ossId"})
@TableName(value = "ip_oss")
public class IpOss implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 知识产权id
     */
    private Long ipId;

    /**
     * 存储对象id
     */
    private Long ossId;

    /**
     * 租户编号
     */
    private String tenantId;
}
