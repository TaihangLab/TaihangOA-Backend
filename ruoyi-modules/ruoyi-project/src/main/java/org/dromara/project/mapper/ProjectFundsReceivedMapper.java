package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectFundsReceived;

/**
 * @author bailingnan
 * @description 针对表【project_funds_received(专项经费到账)】的数据库操作Mapper
 * @createDate 2024-02-29 10:53:51
 * @Entity com.ruoyi.project.domain.ProjectFundsReceived
 */
@Mapper
public interface ProjectFundsReceivedMapper extends BaseMapperPlus<ProjectFundsReceived, ProjectFundsReceived> {

}




