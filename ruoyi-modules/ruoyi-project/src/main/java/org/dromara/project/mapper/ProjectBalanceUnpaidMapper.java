package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectBalanceUnpaid;

/**
 * @author bailingnan
 * @description 针对表【project_balance_unpaid(项目余额表（单位：万元）)】的数据库操作Mapper
 * @createDate 2024-04-01 16:11:46
 * @Entity com.ruoyi.project.domain.ProjectBalanceUnpaid
 */
@Mapper
public interface ProjectBalanceUnpaidMapper extends BaseMapperPlus<ProjectBalanceUnpaid, ProjectBalanceUnpaid> {

}




