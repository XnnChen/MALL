package mall.service.impl;

import mall.dao.GeneticDao;
import mall.service.GeneticService;

import java.io.Serializable;
import java.util.List;

public abstract class GeneticServiceImpl<T extends Serializable, ID extends Number> implements GeneticService<T, ID> {

    GeneticDao<T, ID> geneticDao;

    abstract void setGeneticDao(GeneticDao<T, ID> geneticDao);

    @Override
    public void create(T t) {
        geneticDao.create(t);
    }

    @Override
    public List<T> queryAll() {
        return geneticDao.queryAll();
    }

    @Override
    public List<T> queryList(String sqlId, Object parameter) {
        return geneticDao.queryList(sqlId, parameter);
    }

    @Override
    public T queryById(ID id) {
        return geneticDao.queryById(id);
    }

    @Override
    public void modify(T t) {
        geneticDao.modify(t);
    }

    @Override
    public void remove(ID id) {
        geneticDao.remove(id);
    }

    @Override
    public void create(String sqlId, Object parameter) {
        geneticDao.create(sqlId, parameter);
    }

    @Override
    public T queryOne(String sqlId, Object parameter) {
        return geneticDao.queryOne(sqlId, parameter);
    }

    @Override
    public void modify(String sqlId, Object parameter) {
        geneticDao.remove(sqlId, parameter);
    }
}
