package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.project.domain.ProjectMilestone;
import org.dromara.project.domain.vo.ProjectMilestoneVo;

/**
 * 项目大事记表 数据层
 *
 * @author fanjiaxing
 */
@Mapper
public interface ProjectMilestoneMapper extends BaseMapperPlus<ProjectMilestone, ProjectMilestoneVo> {
}





