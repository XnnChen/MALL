package mall.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import mall.model.Product;
import mall.service.ProductService;
import mall.dao.GenericDao;

import mall.util.Constans;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

@Service
public class ProductServiceImpl extends GenericServiceImpl<Product, Integer> implements ProductService {

    private HttpServletRequest request;

    @Override
    @Autowired
    void setGenericDao(GenericDao<Product, Integer> genericDao) {
        super.genericDao = genericDao;
    }

    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    private String getPictureName(MultipartFile[] multipartFiles, String type){
        ServletContext application = request.getServletContext();
        String filePath;
        switch (type){
            case "cover":
                filePath = application.getRealPath(Constans.COVER_PICTURE_DIR);
                return saveFile(multipartFiles, filePath);
            case "slide":
                filePath = application.getRealPath(Constans.SLIDE_PICTURE_DIR);
                return saveFile(multipartFiles, filePath);
            case "detail":
                filePath = application.getRealPath(Constans.DETAIL_PICTURE_DIR);
                return saveFile(multipartFiles, filePath);
            default:
                return null;
        }
    }

    private String saveFile(MultipartFile[] multipartFiles, String filePath) {
        String[] fileNames = new String[multipartFiles.length];
        for (int i = 0; i < multipartFiles.length; i++) {
            String fileName = System.nanoTime() + "." + FilenameUtils.getExtension(multipartFiles[i].getOriginalFilename());
            try {
                multipartFiles[i].transferTo(new File(filePath, fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            fileNames[i] = fileName;
        }
        return convertToJsonArray(fileNames);
    }

    /**
     *
     * @param strings {"1.jpg", "2.jpg", ...}
     * @return JSON Array [".jpg", "2.jpg", ...]
     */
    private String convertToJsonArray(String[] strings) {
        ObjectMapper mapper = new ObjectMapper();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            mapper.writeValue(byteArrayOutputStream, strings);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] bytes = byteArrayOutputStream.toByteArray();
        return new String(bytes);
    }

    @Override
    public Product getProductWithPictures(Product product, MultipartFile coverPicture, MultipartFile[] slidePictures, MultipartFile[] detailPictures) {
        String coverPictureString = getPictureName(new MultipartFile[]{coverPicture}, "cover");
        String slidePicturesString = getPictureName(slidePictures, "slide");
        String detailPicturesString = getPictureName(detailPictures, "detail");

        product.setCoverPicture(coverPictureString);
        product.setSlidePictures(slidePicturesString);
        product.setDetailPictures(detailPicturesString);
        return product;
    }
}