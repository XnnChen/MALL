package mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import mall.model.Category;
import mall.service.CategoryService;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController extends BaseController {

    private final CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @RequestMapping("create")
    private String create(Category category) {
        categoryService.create(category);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        categoryService.remove(id);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("modify")
    private String modify(Category category) {
        categoryService.modify(category);
        return "redirect:/category/queryAll";
    }

    @RequestMapping("queryAll")
    private String queryAll() {
        session.setAttribute("list", categoryService.queryAll());
        session.setAttribute("categories", categoryService.queryList("queryFirstLevelCategory", null));
        return "redirect:/admin/category/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String queryById(@PathVariable("id") Integer id) {
        session.setAttribute("category", categoryService.queryById(id));
        session.setAttribute("categories", categoryService.queryList("queryFirstLevelCategory", null));
        return "redirect:/admin/category/edit.jsp";
    }

    @RequestMapping("add")
    private String add() {
        session.setAttribute("categories", categoryService.queryList("queryFirstLevelCategory", null));
        return "redirect:/admin/category/add.jsp";
    }

    @RequestMapping("index")
    @ResponseBody
    private List<Category> index(){
        return categoryService.queryList("queryIndexCategories", null);
    }
}