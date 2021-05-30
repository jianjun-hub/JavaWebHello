package cn.edu.niit.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName AdminLogin
 * @Description TODO
 * @Author DARKW
 * @Date 2021/3/29
 **/
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AdminLogin {
    private String userName;
    private  String password;
}
