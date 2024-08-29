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
 * 知识产权和用户关联表
 *
 * @author bailingnan
 * @TableName ip_user
 * @date 2024/02/06
 */
@Data
@EqualsAndHashCode(of = {"ipId", "userId"})
@TableName(value = "ip_user")
public class IpUser implements Serializable {
    @Serial
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 成员id
     */
    private Long userId;

    /**
     * 知识产权id
     */
    private Long ipId;

    /**
     * 租户编号
     */
    private String tenantId;
}

