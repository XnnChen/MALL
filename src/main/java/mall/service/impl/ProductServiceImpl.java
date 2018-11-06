package mall.service.impl;

import mall.model.Product;
import mall.service.ProductService;
import mall.dao.GenericDao;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Service
public class ProductServiceImpl extends GenericServiceImpl<Product, Integer> implements ProductService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<Product, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}