package cn.edu.niit.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Login
 * @Description TODO
 * @Author DARKW
 * @Date 2021/3/22
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Login {
    private String username;
    private String password;
}
