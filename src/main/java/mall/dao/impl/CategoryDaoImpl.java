package mall.dao.impl;

import mall.model.Category;
import mall.dao.CategoryDao;

import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl extends GenericDaoImpl<Category, Integer> implements CategoryDao {
}