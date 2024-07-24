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
public enum ZxZcEnum implements IEnum<Integer> {
    /**
     * 专项
     */
    SPECIAL_ITEM(0, "专项"),
    /**
     * 自筹
     */
    SELF_RAISED(1, "自筹");

    static {
        // 通过名称构建缓存,通过EnumCache.findByName(StatusEnum.class,"SUCCESS",null);调用能获取枚举
        EnumCacheUtils.registerByName(ZxZcEnum.class, ZxZcEnum.values());
        // 通过code构建缓存,通过EnumCache.findByValue(StatusEnum.class,"S",null);调用能获取枚举
        EnumCacheUtils.registerByValue(ZxZcEnum.class, ZxZcEnum.values(), ZxZcEnum::getDescription);
    }

    @EnumValue
    @JsonValue
    private final Integer value;
    private final String description;
}

