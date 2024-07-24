package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectTarget;
import org.dromara.project.domain.vo.ProjectTargetVO;

/**
 * 项目指标表 数据层
 *
 * @author fanjiaxing
 */
@Mapper
public interface ProjectTargetMapper extends BaseMapperPlus<ProjectTarget, ProjectTargetVO> {

}




