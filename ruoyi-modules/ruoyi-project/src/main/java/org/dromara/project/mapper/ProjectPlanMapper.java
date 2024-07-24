package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectPlan;
import org.dromara.project.domain.vo.ProjectPlanVO;

/**
 * 针对表【project_plan(项目计划表)】的数据库操作Mapper
 *
 * @author bailingnan
 * @createDate 2023-12-21 14:26:02
 * @Entity com.ruoyi.project.domain.ProjectPlan
 */
@Mapper
public interface ProjectPlanMapper extends BaseMapperPlus<ProjectPlan, ProjectPlanVO> {

}





