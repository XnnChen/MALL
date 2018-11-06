package mall.dao.impl;

import mall.dao.UserDao;
import mall.model.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends GenericDaoImpl<User, Integer> implements UserDao {
}
