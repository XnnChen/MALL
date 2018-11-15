package mall.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo implements Serializable {
    private Integer id;
    private String username;
    private String avatar;
    private String mobile;
    private String createTime;
    private String updateTime;
    private String updateIp;
    private Integer userId;

    public UserInfo(String createTime, Integer userId) {
        this.createTime = createTime;
        this.userId = userId;
    }
}
