package org.dromara.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.dromara.common.mybatis.core.mapper.BaseMapperPlus;
import org.dromara.project.domain.ProjectExpenditure;
import org.dromara.project.domain.vo.ProjectExpenditureVO;

/**
 * @author bailingnan
 * @description 针对表【project_expenditure(项目支出表)】的数据库操作Mapper
 * @createDate 2024-03-06 18:09:32
 * @Entity com.ruoyi.project.domain.ProjectExpenditure
 */
@Mapper
public interface ProjectExpenditureMapper extends BaseMapperPlus<ProjectExpenditure, ProjectExpenditureVO> {

}




