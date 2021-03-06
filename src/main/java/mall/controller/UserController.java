package mall.controller;

import mall.model.User;
import mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("checkEmail")
    @ResponseBody
    public Map<String, Boolean> checkEmail(String email) {
        Map<String, Boolean> data = new HashMap<>();
        data.put("checkEmail", false);
        if (userService.queryUserByEmail(email) != null) {
            data.put("checkEmail", true);
        }
        return data;
    }

    @RequestMapping("signUp")
    public String signUp(User user) {
        if(userService.signUp(user)){
            return "redirect:/index.jsp";
        }
        request.setAttribute("message","Email existed.");
        return "/sign-up.jsp";
    }

    @RequestMapping("signIn")
    public String signIn(User user){
        user = userService.signIn(user);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/portal/home.jsp";
        }
        request.setAttribute("message","Invalid Email or Password.");
        return "/sign-in.jsp";
    }

    @RequestMapping("signOut")
    public String signOut(){
        session.invalidate();
        return "redirect:/index.jsp";
    }
}
