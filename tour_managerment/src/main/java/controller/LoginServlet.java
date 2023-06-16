package controller;




import model.Role;
import model.User;
import service.UserService;
import ultils.PasswordEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("user_name");
        String password = req.getParameter("user_password");
        User user = userService.findByUsername(username);


        if (user != null) {
            if (PasswordEncoder.check(password, user.getPassword())) {
                HttpSession session = req.getSession();
                session.setAttribute("role", user.getRole().toString());
                if (user.getRole().equals(Role.USER)) {
                    session.setAttribute("user", user);
                    resp.sendRedirect("/user?action=userPage");
                } else {
                    session.setAttribute("user", user);
                    resp.sendRedirect("/admin?action=showUser");
                }
            } else {
                req.setAttribute("errors", "Mật khẩu không đúng!");
                req.getRequestDispatcher("login.jsp")
                        .forward(req,resp);
            }
        }else {
            req.setAttribute("errors", "Tài khoản không tồn tại!");
            req.getRequestDispatcher("login.jsp")
                    .forward(req,resp);
        }
    }
}
