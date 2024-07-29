package org.dromara.system.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.system.domain.SysOssConfig;
import org.dromara.system.domain.vo.SysOssConfigVo;

/**
 * 对象存储配置Mapper接口
 *
 * @author Lion Li
 * @author 孤舟烟雨
 * @date 2021-08-13
 */
@Mapper
public interface SysOssConfigMapper extends BaseMapperPlus<SysOssConfig, SysOssConfigVo> {
    int updateEndPoint(@Param("oldEndPoint") String oldEndPoint, @Param("newEndPoint") String newEndPoint);
}
