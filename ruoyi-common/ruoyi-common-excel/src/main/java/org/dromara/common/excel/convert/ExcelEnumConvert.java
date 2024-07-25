package org.dromara.common.excel.convert;

import cn.hutool.core.annotation.AnnotationUtil;
import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.data.ReadCellData;
import com.alibaba.excel.metadata.data.WriteCellData;
import com.alibaba.excel.metadata.property.ExcelContentProperty;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.core.utils.EnumCacheUtils;
import org.dromara.common.core.utils.reflect.ReflectUtils;
import org.dromara.common.excel.annotation.ExcelEnumFormat;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * 枚举格式化转换处理
 *
 * @author Liang
 */
@Slf4j
public class ExcelEnumConvert implements Converter<Object> {

    @Override
    public Class<Object> supportJavaTypeKey() {
        return Object.class;
    }

    @Override
    public CellDataTypeEnum supportExcelTypeKey() {
        return CellDataTypeEnum.STRING;
    }

    @Override
    public Object convertToJavaData(ReadCellData<?> cellData, ExcelContentProperty contentProperty,
        GlobalConfiguration globalConfiguration) {
        //        Object codeValue = cellData.getData();
        //        // 如果是空值
        //        if (ObjectUtil.isNull(codeValue)) {
        //            return null;
        //        }
        //        Map<Object, String> enumValueMap = beforeConvert(contentProperty);
        //        String textValue = enumValueMap.get(codeValue);
        //        return Convert.convert(contentProperty.getField().getType(), textValue);

        String description = cellData.getStringValue();
        log.info("description:{}", description);
        ExcelEnumFormat anno = getAnnotation(contentProperty.getField());
        return EnumCacheUtils.findByValue(anno.enumClass(), description, null);
    }

    @Override
    public WriteCellData<String> convertToExcelData(Object object, ExcelContentProperty contentProperty,
        GlobalConfiguration globalConfiguration) {
        //        if (ObjectUtil.isNull(object)) {
        //            return new WriteCellData<>("");
        //        }
        //        Map<Object, String> enumValueMap = beforeConvert(contentProperty);
        //        String value = Convert.toStr(enumValueMap.get(object), "");
        //        return new WriteCellData<>(value);
        //        return new WriteCellData<>(object.toString());
        if (object == null) {
            return new WriteCellData<>("");
        }

        ExcelEnumFormat anno = getAnnotation(contentProperty.getField());
        Map<Object, String> enumValueMap = beforeConvert(contentProperty);

        String description = enumValueMap.get(getEnumValue(object, anno.codeField()));
        return new WriteCellData<>(description);
    }

    private Object getEnumValue(Object enumInstance, String codeField) {
        return ReflectUtils.invokeGetter(enumInstance, codeField);
    }

    private Map<Object, String> beforeConvert(ExcelContentProperty contentProperty) {
        ExcelEnumFormat anno = getAnnotation(contentProperty.getField());
        Map<Object, String> enumValueMap = new HashMap<>();
        Enum<?>[] enumConstants = anno.enumClass().getEnumConstants();
        for (Enum<?> enumConstant : enumConstants) {
            Object codeValue = ReflectUtils.invokeGetter(enumConstant, anno.codeField());
            String textValue = ReflectUtils.invokeGetter(enumConstant, anno.textField());
            enumValueMap.put(codeValue, textValue);
        }
        return enumValueMap;
    }

    private ExcelEnumFormat getAnnotation(Field field) {
        return AnnotationUtil.getAnnotation(field, ExcelEnumFormat.class);
    }
}
