package mall.service.impl;

import mall.dao.GenericDao;
import mall.model.UserInfo;
import mall.service.UserInfoService;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl extends GenericServiceImpl<UserInfo, Integer> implements UserInfoService {
    @Override
    void setGenericDao(GenericDao<UserInfo, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}
