package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectFunds;
import org.dromara.project.domain.vo.ProjectFundsVO;

/**
 * @author bailingnan
 * @description 针对表【project_funds(项目经费表（单位：万元）)】的数据库操作Mapper
 * @createDate 2024-03-20 15:00:08
 * @Entity com.ruoyi.project.domain.ProjectFunds
 */
@Mapper
public interface ProjectFundsMapper extends BaseMapperPlus<ProjectFunds, ProjectFundsVO> {

}




