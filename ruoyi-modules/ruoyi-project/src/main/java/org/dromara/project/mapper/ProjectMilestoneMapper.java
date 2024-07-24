package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectMilestone;
import org.dromara.project.domain.vo.ProjectMilestoneVO;

/**
 * 项目大事记表 数据层
 *
 * @author fanjiaxing
 */
@Mapper
public interface ProjectMilestoneMapper extends BaseMapperPlus<ProjectMilestone, ProjectMilestoneVO> {
}





