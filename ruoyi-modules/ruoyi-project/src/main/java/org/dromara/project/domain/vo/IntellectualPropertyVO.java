package org.dromara.project.domain.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.common.core.enums.IntellectualPropertyStatusEnum;
import org.dromara.common.core.enums.IntellectualPropertyTypeEnum;
import org.dromara.common.excel.annotation.ExcelEnumFormat;
import org.dromara.common.excel.convert.ExcelEnumConvert;
import org.dromara.project.domain.IntellectualProperty;

import java.time.LocalDate;

/**
 * 知识产权VO
 *
 * @author bailingnan
 * @date 2024/1/4
 */
@Data
@AutoMapper(target = IntellectualProperty.class)
public class IntellectualPropertyVO {
    /**
     * 知识产权id
     */
    private Long ipId;
    /**
     * 项目id
     */
    private Long projectId;

    /**
     * 关联项目名称
     */
    @ExcelProperty(value = "关联项目名称")
    private String assignedSubjectName;

    /**
     * 知识产权名
     */
    @ExcelProperty(value = "知识产权名")
    private String ipName;
    /**
     * 知识产权类别,国内发明专利0、软件著作权1、论文2、标准3
     */
    @ExcelProperty(value = "三级科目", converter = ExcelEnumConvert.class)
    @ExcelEnumFormat(enumClass = IntellectualPropertyTypeEnum.class, codeField = "value", textField = "description")
    private IntellectualPropertyTypeEnum ipType;
    /**
     * 知识产权状态,专利受理0，专利授权1，软著已获取2，标准正在申报3，标准已通过4，论文已发表5
     */
    @ExcelProperty(value = "三级科目", converter = ExcelEnumConvert.class)
    @ExcelEnumFormat(enumClass = IntellectualPropertyStatusEnum.class, codeField = "value", textField = "description")
    private IntellectualPropertyStatusEnum ipStatus;
    /**
     * 获得日期
     */
    @ExcelProperty(value = "获得日期")
    private LocalDate ipDate;
}
