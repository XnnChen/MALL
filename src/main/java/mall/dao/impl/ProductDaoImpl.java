package mall.dao.impl;

import mall.model.Product;
import mall.dao.ProductDao;

import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl extends GenericDaoImpl<Product, Integer> implements ProductDao {
}