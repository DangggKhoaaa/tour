package controller;

import dto.Pageable;
import model.Gender;
import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null)
            action = "";
        switch (action) {
            case "showUser":
                showUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            case "showInformation":
                showInformation(req, resp);
                break;


        }
    }



    private void showInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.findById(id);
        req.setAttribute("genders", Gender.values());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/information.jsp").forward(req, resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        userService.deleteUsers(id);
        req.setAttribute("message","Xóa thành công!");
        showUser(req, resp);
    }

    private void showUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        int TOTAL_ITEMS = 8;
        Pageable pageable = new Pageable(search, page, TOTAL_ITEMS);
        req.setAttribute("pageable", pageable);
        List<User> users = userService.findAll(pageable);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }
}
