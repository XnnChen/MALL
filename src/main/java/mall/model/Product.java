package mall.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable {
    private Integer id;
    private String title;
    private String desc;
    private double price;
    private double originalPrice;
    private String coverPicture;
    private String slidePictures;
    private String detailPictures;
    private String spec;
    private int stock;
    private int status;
    private String createTime;
    private String updateTime;
    private Integer categoryId;
}