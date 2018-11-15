package mall.controller;

import mall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import mall.model.Product;
import mall.service.ProductService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController {

    private ProductService productService;
    private CategoryService categoryService;

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping("create")
    private String create(
            Product product,
            @RequestParam MultipartFile coverPictureFile,
            @RequestParam MultipartFile[] slidePictureFiles,
            @RequestParam MultipartFile[] detailPictureFiles) {
        productService.create(productService.getProductWithPictures(
                product,
                coverPictureFile,
                slidePictureFiles,
                detailPictureFiles
        ));
        return "redirect:/product/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        productService.remove(id);
        return "redirect:/product/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Product product) {
        productService.modify(product);
        return "redirect:/product/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", productService.queryAll());
        return "redirect:/admin/product/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("product", productService.queryById(id));
        return "redirect:/admin/product/edit.jsp";
    }

    @RequestMapping("add")
    private String add(){
        session.setAttribute("categories", categoryService.queryList("queryCategoryTree", null));
        return "redirect:/admin/product/add.jsp";
    }

    @RequestMapping("index")
    @ResponseBody
    private List<Product> index(){
        return productService.queryList("queryIndexProducts", null);
    }
}