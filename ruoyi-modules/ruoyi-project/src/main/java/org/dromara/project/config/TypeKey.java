package org.dromara.project.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.dromara.common.core.enums.*;

/**
 * 经费支出映射到字段
 *
 * @author bailingnan
 * @date 2024/03/08
 */
@Data
@AllArgsConstructor
public class TypeKey {
    private ZxZcEnum zxZcEnum;
    private ZjJjEnum zjJjEnum;
    private FirstLevelSubjectEnum firstLevelSubjectEnum;
    private SecondLevelSubjectEnum secondLevelSubjectEnum;
    private ThirdLevelSubjectEnum thirdLevelSubjectEnum;
}
