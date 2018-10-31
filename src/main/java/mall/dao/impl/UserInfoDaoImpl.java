package mall.dao.impl;

import mall.dao.UserInfoDao;
import mall.model.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoDaoImpl extends GeneticDaoImpl<UserInfo, Integer> implements UserInfoDao {
}
