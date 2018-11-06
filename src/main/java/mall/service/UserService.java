package mall.service;

import mall.model.User;

public interface UserService extends GenericService<User, Integer> {

    User queryUserByEmail(String email);

    boolean signUp(User user);

    User signIn(User user);
}
