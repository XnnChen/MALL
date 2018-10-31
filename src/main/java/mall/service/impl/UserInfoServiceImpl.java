package mall.service.impl;

import mall.dao.GeneticDao;
import mall.model.UserInfo;
import mall.service.UserInfoService;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl extends GeneticServiceImpl<UserInfo, Integer> implements UserInfoService {
    @Override
    void setGeneticDao(GeneticDao<UserInfo, Integer> geneticDao) {
        super.geneticDao = geneticDao;
    }
}
