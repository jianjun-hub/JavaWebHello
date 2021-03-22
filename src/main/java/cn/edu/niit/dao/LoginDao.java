package cn.edu.niit.dao;

import cn.edu.niit.db.JDBCUtil;
import cn.edu.niit.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @ClassName LoginDao
 * @Description TODO
 * @Author DARKW
 * @Date 2021/3/22
 **/
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LoginDao {
    public User selectOne(String username) {
        User user = new User();
        try (ResultSet rs = JDBCUtil.getInstance().executeQueryRS("select * from borrow_card where username = ?", new Object[]{username})) {
            while (rs.next()) {
                user = new User(rs.getString("username"), rs.getString("password"), rs.getString("reader"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
