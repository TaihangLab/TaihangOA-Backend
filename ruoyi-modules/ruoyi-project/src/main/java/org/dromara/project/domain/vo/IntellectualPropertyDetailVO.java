package org.dromara.project.domain.vo;

import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.common.core.enums.IntellectualPropertyStatusEnum;
import org.dromara.common.core.enums.IntellectualPropertyTypeEnum;
import org.dromara.project.domain.IntellectualProperty;
import org.dromara.system.domain.vo.SysOssVo;

import java.time.LocalDate;
import java.util.List;

/**
 * 知识产权详情VO
 *
 * @author bailingnan
 * @date 2024/1/3
 */
@Data
@AutoMapper(target = IntellectualProperty.class)
public class IntellectualPropertyDetailVO {
    /**
     * 知识产权id
     */
    private Long ipId;
    /**
     * 项目id
     */
    private Long projectId;

    /**
     * 项目路径
     */
    private List<Long> projectPath;

    /**
     * 关联项目名称
     */
    private String assignedSubjectName;
    /**
     * 知识产权名
     */
    private String ipName;
    /**
     * 知识产权类别,国内发明专利0、软件著作权1、论文2、标准3
     */
    private IntellectualPropertyTypeEnum ipType;
    /**
     * 知识产权状态,专利受理0，专利授权1，软著已获取2，标准正在申报3，标准已通过4，论文已发表5
     */
    private IntellectualPropertyStatusEnum ipStatus;
    /**
     * 获得日期
     */
    private LocalDate ipDate;
    /**
     * 知识产权成员列表
     */
    private List<IpUserVO> ipUserVOList;
    /**
     * 知识产权成员路径列表
     */
    private List<List<Long>> userPathList;

    /**
     * 知识产权附件列表
     */
    private List<SysOssVo> sysOssVoList;

}
