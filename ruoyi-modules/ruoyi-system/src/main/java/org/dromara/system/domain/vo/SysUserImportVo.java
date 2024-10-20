package org.dromara.system.domain.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.dromara.common.core.enums.DiplomaTypeEnum;
import org.dromara.common.core.enums.JobTitleEnum;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.annotation.ExcelEnumFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import org.dromara.common.excel.convert.ExcelEnumConvert;

import java.io.Serial;
import java.io.Serializable;

/**
 * 用户对象导入VO
 *
 * @author Lion Li
 */

@Data
@NoArgsConstructor
// @Accessors(chain = true) // 导入不允许使用 会找不到set方法
public class SysUserImportVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户序号")
    private Long userId;

    /**
     * 部门ID
     */
    @ExcelProperty(value = "部门编号")
    private Long deptId;

    /**
     * 用户账号
     */
    @ExcelProperty(value = "登录名称")
    private String userName;

    /**
     * 用户昵称
     */
    @ExcelProperty(value = "用户名称")
    private String nickName;

    /**
     * 用户邮箱
     */
    @ExcelProperty(value = "用户邮箱")
    private String email;

    /**
     * 手机号码
     */
    @ExcelProperty(value = "手机号码")
    private String phonenumber;

    @ExcelProperty(value = "用户职称", converter = ExcelEnumConvert.class)
    @ExcelEnumFormat(enumClass = JobTitleEnum.class, textField = "description")
    private JobTitleEnum jobTitle;

    /**
     * 用户学历
     */
    @ExcelProperty(value = "用户学历", converter = ExcelEnumConvert.class)
    @ExcelEnumFormat(enumClass = DiplomaTypeEnum.class, textField = "description")
    private DiplomaTypeEnum diploma;

    /**
     * 用户性别
     */
    @ExcelProperty(value = "用户性别", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_user_sex")
    private String sex;

    /**
     * 帐号状态（0正常 1停用）
     */
    @ExcelProperty(value = "帐号状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_normal_disable")
    private String status;

}
