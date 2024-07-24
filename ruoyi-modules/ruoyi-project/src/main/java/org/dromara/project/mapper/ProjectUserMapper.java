package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectUser;

import java.util.List;
import java.util.Map;

/**
 * 项目成员表 数据层
 *
 * @author bailingnan
 */
@Mapper
public interface ProjectUserMapper extends BaseMapperPlus<ProjectUser, ProjectUser> {
    List<Map<String, Object>> getProjectLevelCountByUserId(Long userId);

    List<Map<String, Object>> getNowProjectLevelCountByUserId(Long userId);
}




