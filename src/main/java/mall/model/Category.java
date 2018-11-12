package mall.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category extends BaseModel {
    private Integer id;
    private String title;
    private String desc;
    private int parentId;
    private int status;
    private String createTime;
    private String updateTime;
    private List<Category> categories;
}