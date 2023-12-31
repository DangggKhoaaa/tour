package filter;


import model.Role;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class FilterAdmin implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpSession session = httpServletRequest.getSession();

        String role = (String)session.getAttribute("role");
        //chua co thi dieu huong ve login
        if(role == null || role.equals(Role.USER.toString())){
            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
//            httpServletResponse.sendRedirect("");
            httpServletRequest.getRequestDispatcher("error.jsp").forward(httpServletRequest,httpServletResponse);
            return;
        }
        //bo qua
        chain.doFilter(request, response);
    }
}
