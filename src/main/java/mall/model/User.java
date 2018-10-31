package mall.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User extends BaseModel {
    private Integer id;
    private String email;
    private String password;
    private UserInfo userInfo;
}
