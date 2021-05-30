package cn.edu.niit.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName LoginFilter
 * @Description TODO
 * @Author DARKW
 * @Date 2021/3/29
 **/
@WebFilter(filterName = "adminFilter",urlPatterns = "/login")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
         String role = (String) req.getAttribute("role");
            if("admin".equals(role)){
                ((HttpServletRequest) req).getRequestDispatcher("/admin"+"/login").forward(req,resp);
            }else {
                ((HttpServletRequest) req).getRequestDispatcher("/login").forward(req,resp);
            }
    }

}
