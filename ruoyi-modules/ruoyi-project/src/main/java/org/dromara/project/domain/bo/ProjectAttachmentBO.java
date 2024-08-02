package org.dromara.project.domain.bo;

import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import org.dromara.project.domain.ProjectAttachment;

/**
 * 项目附件BO
 *
 * @author bailingnan
 * @date 2023/12/15
 */
@Data
@AutoMapper(target = ProjectAttachment.class, reverseConvertGenerate = false)
public class ProjectAttachmentBO {
    /**
     * 项目id
     */
    private Long projectId;

    /**
     * 文件oss_id
     */
    private Long ossId;
}
