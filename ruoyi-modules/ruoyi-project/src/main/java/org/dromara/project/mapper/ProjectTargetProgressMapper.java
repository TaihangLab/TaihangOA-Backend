package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectTargetProgress;
import org.dromara.project.domain.vo.ProjectTargetProgressVO;

/**
 * 项目指标进度表
 *
 * @author bailingnan
 * @description 针对表【project_target_progress(项目指标进度表)】的数据库操作Mapper
 * @createDate 2024-08-22 09:29:16
 * @Entity org.dromara.project.domain.ProjectTargetProgress
 */
@Mapper
public interface ProjectTargetProgressMapper extends BaseMapperPlus<ProjectTargetProgress, ProjectTargetProgressVO> {

}




