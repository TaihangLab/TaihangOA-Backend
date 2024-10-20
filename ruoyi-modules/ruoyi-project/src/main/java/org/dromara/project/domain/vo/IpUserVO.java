package org.dromara.project.domain.vo;

import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.common.core.enums.DiplomaTypeEnum;
import org.dromara.common.core.enums.JobTitleEnum;
import org.dromara.project.domain.IpUser;

/**
 * 知识产权用户VO
 *
 * @author bailingnan
 * @date 2024/1/3
 */
@Data
@AutoMapper(target = IpUser.class)
public class IpUserVO {
    /**
     * ID
     */
    private Long userId;

    /**
     * 用户姓名
     */
    private String nickName;

    /**
     * 用户职称
     */
    private JobTitleEnum jobTitle;

    /**
     * 用户学历
     */
    private DiplomaTypeEnum diploma;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 手机号码
     */
    private String phonenumber;

    /**
     * 部门名称
     */
    private String deptName;
}
