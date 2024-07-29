package org.dromara.project.service.Impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.ProjectBalancePaid;
import org.dromara.project.domain.ProjectBalanceUnpaid;
import org.dromara.project.domain.ProjectFunds;
import org.dromara.project.domain.bo.ProjectBaseInfoBO;
import org.dromara.project.domain.vo.ProjectFundsManagementVO;
import org.dromara.project.service.ProjectBalanceService;
import org.dromara.project.service.ProjectBaseInfoService;
import org.dromara.project.service.ProjectFundsManagementService;
import org.dromara.project.service.ProjectFundsService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 经费管理
 *
 * @author bailingnan
 * @date 2024/04/01
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ProjectFundsManagementServiceImpl implements ProjectFundsManagementService {

    private final ProjectBaseInfoService projectBaseInfoService;

    private final ProjectBalanceService projectBalanceService;

    private final ProjectFundsService projectFundsService;

    @Override
    public TableDataInfo<ProjectFundsManagementVO> queryPageList(ProjectBaseInfoBO projectBaseInfoBO,
        PageQuery pageQuery) {
        Page<ProjectFundsManagementVO> page =
            projectBaseInfoService.queryPageAllList(projectBaseInfoBO, pageQuery, ProjectFundsManagementVO.class);
        buildRecords(page.getRecords());
        return TableDataInfo.build(page);
    }

    private void buildRecords(List<ProjectFundsManagementVO> projectFundsManagementVOList) {
        if (projectFundsManagementVOList == null || projectFundsManagementVOList.isEmpty()) {
            return;
        }
        List<Long> projectIdList = projectFundsManagementVOList.stream().map(ProjectFundsManagementVO::getProjectId)
            .collect(Collectors.toList());
        //获取经费对应信息
        Map<Long, ProjectFunds> projectFundsMap = projectFundsService.getProjectFundsMapByProjectIdList(projectIdList);
        //获取已支付余额对应信息
        Map<Long, ProjectBalancePaid> projectBalancePaidMap =
            projectBalanceService.getProjectBalancePaidMapByPorjectIdList(projectIdList);
        //获取未支付余额对应信息
        Map<Long, ProjectBalanceUnpaid> projectBalanceUnpaidMap =
            projectBalanceService.getProjectBalanceUnpaidMapByPorjectIdList(projectIdList);

        projectFundsManagementVOList.forEach(projectFundsManagementVO -> {
            Long projectId = projectFundsManagementVO.getProjectId();
            //处理经费
            ProjectFunds projectFunds = projectFundsMap.get(projectId);
            setFunds(projectFundsManagementVO, projectFunds);
            setBalance(projectFundsManagementVO, projectBalancePaidMap.get(projectId),
                projectBalanceUnpaidMap.get(projectId));
        });
    }

    private void setFunds(ProjectFundsManagementVO projectFundsManagementVO, ProjectFunds projectFunds) {
        if (projectFunds != null) {
            projectFundsManagementVO.setTotalFundsAll(projectFunds.getTotalFundsAll());
            projectFundsManagementVO.setTotalFundsZx(projectFunds.getTotalFundsZx());
            projectFundsManagementVO.setTotalFundsZc(projectFunds.getTotalFundsZc());
        }
    }

    private void setBalance(ProjectFundsManagementVO projectFundsManagementVO, ProjectBalancePaid projectBalancePaid,
        ProjectBalanceUnpaid projectBalanceUnpaid) {
        if (projectBalancePaid != null && projectBalanceUnpaid != null) {
            projectFundsManagementVO.setTotalFundsAllPaid(projectBalancePaid.getTotalFundsAllPaid());
            projectFundsManagementVO.setTotalFundsZxPaid(projectBalancePaid.getTotalFundsZxPaid());
            projectFundsManagementVO.setTotalFundsZcPaid(projectBalancePaid.getTotalFundsZcPaid());
            projectFundsManagementVO.setTotalFundsAllUnpaid(projectBalanceUnpaid.getTotalFundsAllUnpaid());
            projectFundsManagementVO.setTotalFundsZxUnpaid(projectBalanceUnpaid.getTotalFundsZxUnpaid());
            projectFundsManagementVO.setTotalFundsZcUnpaid(projectBalanceUnpaid.getTotalFundsZcUnpaid());
        }
    }
}
