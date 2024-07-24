package org.dromara.common.core.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.baomidou.mybatisplus.annotation.IEnum;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import org.dromara.common.core.utils.EnumCacheUtils;

@Getter
@AllArgsConstructor
@ToString
public enum ZjJjEnum implements IEnum<Integer> {
    /**
     * 直接
     */
    DIRECT_EXPENSE(0, "直接"),
    /**
     * 间接
     */
    INDIRECT_EXPENSE(1, "间接");

    static {
        // 通过名称构建缓存,通过EnumCache.findByName(StatusEnum.class,"SUCCESS",null);调用能获取枚举
        EnumCacheUtils.registerByName(ZjJjEnum.class, ZjJjEnum.values());
        // 通过code构建缓存,通过EnumCache.findByValue(StatusEnum.class,"S",null);调用能获取枚举
        EnumCacheUtils.registerByValue(ZjJjEnum.class, ZjJjEnum.values(), ZjJjEnum::getDescription);
    }

    @EnumValue
    @JsonValue
    private final Integer value;
    private final String description;
}
