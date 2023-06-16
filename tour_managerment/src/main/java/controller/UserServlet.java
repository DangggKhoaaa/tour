package controller;



import dto.Pageable;
import model.Gender;
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
import java.sql.Date;


@WebServlet(name = "userServlet", value = "/user")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null)
            action = "";
        switch (action) {
            case "create":
                showCreateUser(req, resp);
                break;
            case "updatePassword":
                showUpdatePassword(req, resp);
                break;
            case "updateInfo":
                showUpdateInfo(req, resp);
                break;
            case "userPage":
                showUserPage(req, resp);
                break;
            case "showInformation":
                showInformation(req, resp);
                break;
//            default:
//                showUser(req, resp);
        }
    }

    private void showInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.findById(id);
        req.setAttribute("genders", Gender.values());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/information.jsp").forward(req, resp);
    }


    private void showUpdateInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.findById(id);
        req.setAttribute("genders", Gender.values());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/updateInfo.jsp").forward(req, resp);
    }


    private void showUpdatePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.findById(id);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/updatePassword.jsp").forward(req, resp);
    }

    private void showCreateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("genders", Gender.values());
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    private void showUserPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        req.setAttribute("user", user);
        req.getRequestDispatcher("/user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null)
            action = "";
        switch (action) {
            case "create":
                createUser(req, resp);
                break;
            case "updatePassword":
                updatePassword(req, resp);
                break;
            case "updateInfo":
                updateInfo(req, resp);
                break;
//            case "showInformation":
//                showInformation(req, resp);
//                break;
//            default:
//                showUser(req, resp);
        }
    }

    private void updateInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("user_id"));
        String name = req.getParameter("full_name");
        Date dob = Date.valueOf(req.getParameter("dob"));
        String genderS = req.getParameter("gender");
        Gender gender = Gender.valueOf(genderS);
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String cccd = req.getParameter("cccd");
        User user = new User(id, name, dob, gender, phone, email, address, cccd);
        userService.updateInfo(user);
        req.setAttribute("message", "Đổi thông tin thành công!");
        req.setAttribute("genders", Gender.values());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/updateInfo.jsp").forward(req, resp);
    }

    private void updatePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("user_id"));
        String oldPassword = req.getParameter("old_user_password");
        String newPassword = PasswordEncoder.encode(req.getParameter("new_user_password"));
        User user = userService.findById(id);
        if (PasswordEncoder.check(oldPassword, user.getPassword())) {
            user.setPassword(newPassword);
            userService.updatePassword(user);
            req.setAttribute("message", "Đổi mật khẩu thành công!");
            req.setAttribute("user", user);
            req.getRequestDispatcher("/user.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Mật khẩu cũ không đúng!");
            req.setAttribute("user", user);
            req.getRequestDispatcher("/updatePassword.jsp").forward(req, resp);
        }
    }

    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userName = req.getParameter("user_name");
        String userPassword = PasswordEncoder.encode(req.getParameter("user_password"));
        String name = req.getParameter("full_name");
        Date dob = Date.valueOf(req.getParameter("dob"));
        String genderS = req.getParameter("gender");
        Gender gender = Gender.valueOf(genderS);
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String cccd = req.getParameter("cccd");

        User user = new User(userName, userPassword, name, dob, gender, phone, email, address, cccd);
        user.setRole(Role.USER);
        userService.create(user);
        req.setAttribute("message", "Tạo tài khoản thành công!");
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }


}
