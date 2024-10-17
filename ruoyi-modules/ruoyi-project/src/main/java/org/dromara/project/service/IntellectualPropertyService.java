package org.dromara.project.service;

import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.project.domain.bo.IntellectualPropertyBO;
import org.dromara.project.domain.vo.IntellectualPropertyDetailVO;
import org.dromara.project.domain.vo.IntellectualPropertyVO;

import java.util.List;
import java.util.Map;

/**
 * 知识产权
 *
 * @author bailingnan
 * @date 2023/12/29
 */
public interface IntellectualPropertyService {
    /**
     * 新增知识产权
     *
     * @param intellectualPropertyBO
     */
    void insertIntellectualProperty(IntellectualPropertyBO intellectualPropertyBO);

    /**
     * 删除知识产权
     *
     * @param ipId
     */
    void deleteIntellectualProperty(Long ipId);

    /**
     * 更新知识产权
     *
     * @param intellectualPropertyBO
     */
    void updateIntellectualProperty(IntellectualPropertyBO intellectualPropertyBO);

    /**
     * 获取知识产权详情
     *
     * @param ipId
     *
     * @return {@link IntellectualPropertyDetailVO}
     */
    IntellectualPropertyDetailVO getIntellectualPropertyDetail(Long ipId);

    /**
     * 获取知识产权列表
     *
     * @param intellectualPropertyBO
     * @param pageQuery
     *
     * @return {@link TableDataInfo}<{@link IntellectualPropertyVO}>
     */
    TableDataInfo<IntellectualPropertyVO> queryIntellectualPropertVOList(IntellectualPropertyBO intellectualPropertyBO,
        PageQuery pageQuery);

    List<IntellectualPropertyVO> queryIntellectualPropertVOList(IntellectualPropertyBO intellectualPropertyBO);

    /**
     * 获取知识产权统计数据
     *
     * @return {@link Map}<{@link String}, {@link Integer}>
     */
    Map<String, Integer> getIpTypeStatistics();

    /**
     * 根据大事记Id删除知识产权
     *
     * @param milestoneId
     */
    void deleteIntellectualPropertyByMilestoneId(Long milestoneId);

    /**
     * 根据大事记Id列表删除知识产权
     *
     * @param milstoneIdList
     */
    void deleteIntellectualPropertyByMilstoneIdList(List<Long> milstoneIdList);

    /**
     * 根据项目Id删除知识产权
     *
     * @param projectId
     */
    void deleteIntellectualPropertyByProjectId(Long projectId);
}
