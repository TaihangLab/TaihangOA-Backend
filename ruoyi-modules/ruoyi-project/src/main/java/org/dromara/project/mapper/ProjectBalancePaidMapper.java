package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectBalancePaid;

/**
 * @author bailingnan
 * @description 针对表【project_balance_paid(项目余额表（单位：万元）)】的数据库操作Mapper
 * @createDate 2024-04-01 16:11:09
 * @Entity com.ruoyi.project.domain.ProjectBalancePaid
 */
@Mapper
public interface ProjectBalancePaidMapper extends BaseMapperPlus<ProjectBalancePaid, ProjectBalancePaid> {

}




