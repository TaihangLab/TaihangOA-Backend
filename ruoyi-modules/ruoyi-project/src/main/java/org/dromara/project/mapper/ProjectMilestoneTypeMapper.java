package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectMilestoneType;

/**
 * @author bailingnan
 * @description 针对表【project_milestone_type】的数据库操作Mapper
 * @createDate 2024-07-24 15:16:08
 * @Entity org.dromara.project.domain.ProjectMilestoneType
 */
@Mapper
public interface ProjectMilestoneTypeMapper extends BaseMapperPlus<ProjectMilestoneType, ProjectMilestoneType> {
}




