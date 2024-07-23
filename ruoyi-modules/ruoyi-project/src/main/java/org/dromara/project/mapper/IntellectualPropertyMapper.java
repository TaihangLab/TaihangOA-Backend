package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.IntellectualProperty;
import org.dromara.project.domain.vo.IntellectualPropertyVO;

/**
 * 针对表【intellectual_property(知识产权表)】的数据库操作Mapper
 *
 * @author bailingnan
 * @createDate 2023-12-29 17:30:26
 * @Entity com.ruoyi.ip.domin.IntellectualProperty
 * @date 2024/02/06
 */
@Mapper
public interface IntellectualPropertyMapper extends BaseMapperPlus<IntellectualProperty, IntellectualPropertyVO> {

}




