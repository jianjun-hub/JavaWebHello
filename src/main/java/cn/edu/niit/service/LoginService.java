package cn.edu.niit.service;

import cn.edu.niit.dao.LoginDao;
import cn.edu.niit.domain.Login;
import cn.edu.niit.domain.User;

;

/**
 * @ClassName LoginService
 * @Description TODO
 * @Author DARKW
 * @Date 2021/3/22
 **/

public class LoginService {
    private LoginDao loginDao = new LoginDao();

    public static String login(Login loginParam) {
        User user =
        if (user != null) {
            if (loginParam.getPassword().equals(user.getPassword())) {
                return "1";
            } else {
                return "密码错误";
            }
        } else {
            return "用户不存在";
        }
    }
}
