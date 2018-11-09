package mall.service;

import mall.model.Product;
import org.springframework.web.multipart.MultipartFile;

public interface ProductService extends GenericService<Product, Integer> {

    Product getProductWithPictures(
            Product product,
            MultipartFile coverPicture,
            MultipartFile[] slidePictures,
            MultipartFile[] detailPictures
    );
}