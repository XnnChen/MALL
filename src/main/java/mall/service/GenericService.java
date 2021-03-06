package mall.service;

import java.io.Serializable;
import java.util.List;

public interface GenericService<T extends Serializable, ID extends Number> {

    void create(T t);

    List<T> queryAll();

    List<T> queryList(String sqlId, Object parameter);

    T queryById(ID id);

    void modify(T t);

    void remove(ID id);

    void create(String sqlId, Object parameter);

    T queryOne(String sqlId, Object parameter);

    void modify(String sqlId, Object parameter);
}
