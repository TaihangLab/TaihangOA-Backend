package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectBaseInfo;
import org.dromara.project.domain.vo.ProjectBaseInfoVO;

/**
 * 针对表【project_base_info(项目表)】的数据库操作Mapper
 *
 * @author bailingnan
 * @createDate 2023-12-13 23:08:39
 * @Entity com.ruoyi.project.domain.ProjectBaseInfo
 * @date 2024/02/06
 */
@Mapper
public interface ProjectBaseInfoMapper extends BaseMapperPlus<ProjectBaseInfo, ProjectBaseInfoVO> {

}




