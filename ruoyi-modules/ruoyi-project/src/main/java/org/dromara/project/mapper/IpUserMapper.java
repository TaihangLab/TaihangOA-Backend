package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.IpUser;
import org.dromara.project.domain.vo.IpUserVO;

/**
 * 针对表【ip_user(知识产权和用户关联表)】的数据库操作Mapper
 *
 * @author bailingnan
 * @createDate 2024-01-05 17:04:23
 * @Entity com.ruoyi.ip.domain.IpUser
 * @date 2024/02/06
 */
@Mapper
public interface IpUserMapper extends BaseMapperPlus<IpUser, IpUserVO> {

}




