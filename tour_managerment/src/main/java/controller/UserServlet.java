package controller;


import dto.Pageable;
import model.*;
import service.*;
import ultils.PasswordEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;



@WebServlet(name = "userServlet", value = "/user")
public class UserServlet extends HttpServlet {
    TourTicketService tourTicketService=new TourTicketService();
    UserService userService = new UserService();
    int totalItem=5;

    TourService tourService=new TourService();
    TagService tagService=new TagService();
    Tour_tagService tour_tagService=new Tour_tagService();

    static {
        Map<Integer, String> map = new HashMap<>();
        map.put(1, "Tên không được để trống");
    }

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
            case "home":
                showHOme(req,resp);
                break;
            case"cart":
                showCart(req,resp);
                break;
            case"pay":
                pay(req,resp);
                break;
            case "deleteTourTicket":
                deleteTourTicket(req,resp);
                break;
//            default:
//                showUser(req, resp);
        }
    }

    public void showCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        User user=userService.findById(user_id);
        String search =req.getParameter("search");
        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName="tour_ticket_id";
        if(req.getParameter("fieldName") != null){
            fieldName = req.getParameter("fieldName");
        }
        String sortby ="desc";
        if(req.getParameter("sortby") != null){
            sortby = req.getParameter("sortby");
        }
        Pageable pageAble =new Pageable(search,page,totalItem,fieldName,sortby);
        tourTicketService.deleteOutOfDate();
        List<TourTicket> tourTickets= tourTicketService.findAllByUserId(pageAble,user);
        req.setAttribute("user",user);
        req.setAttribute("tourTickets",tourTickets);
        req.getRequestDispatcher("cart.jsp").forward(req,resp);
    }
    private void pay(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tour_ticket_id = Integer.parseInt(req.getParameter("tour_ticket_id"));
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        tourTicketService.pay(tour_ticket_id);

        User user=userService.findById(user_id);
        String search =req.getParameter("search");
        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName="tour_ticket_id";
        if(req.getParameter("fieldName") != null){
            fieldName = req.getParameter("fieldName");
        }
        String sortby ="desc";
        if(req.getParameter("sortby") != null){
            sortby = req.getParameter("sortby");
        }
        Pageable pageAble =new Pageable(search,page,totalItem,fieldName,sortby);
        List<TourTicket> tourTickets= tourTicketService.findAllByUserId(pageAble,user);
        req.setAttribute("tourTickets",tourTickets);
        req.getRequestDispatcher("cart.jsp").forward(req,resp);

    }
    private void deleteTourTicket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tour_ticket_id = Integer.parseInt(req.getParameter("tour_ticket_id"));
        tourTicketService.deleteTourTicket(tour_ticket_id);
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        User user=userService.findById(user_id);
        String search =req.getParameter("search");
        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName="tour_ticket_id";
        if(req.getParameter("fieldName") != null){
            fieldName = req.getParameter("fieldName");
        }
        String sortby ="desc";
        if(req.getParameter("sortby") != null){
            sortby = req.getParameter("sortby");
        }
        Pageable pageAble =new Pageable(search,page,totalItem,fieldName,sortby);
        tourTicketService.deleteOutOfDate();
        List<TourTicket> tourTickets= tourTicketService.findAllByUserId(pageAble,user);
        req.setAttribute("user",user);
        req.setAttribute("tourTickets",tourTickets);
        req.getRequestDispatcher("cart.jsp").forward(req,resp);
    }
    private void showHOme(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search =req.getParameter("search");
        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName="t1.tour_id";
        if(req.getParameter("fieldName") != null){
            fieldName = req.getParameter("fieldName");
        }
        String sortby ="desc";
        if(req.getParameter("sortby") != null){
            sortby = req.getParameter("sortby");
        }

        Pageable pageAble =new Pageable(search,page,totalItem,fieldName,sortby);
        req.setAttribute("pageable",pageAble);
        req.setAttribute("tours",tourService.findAll(pageAble));
        req.getRequestDispatcher("home.jsp").forward(req,resp);
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
        String search =req.getParameter("search");
        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName="t1.tour_id";
        if(req.getParameter("fieldName") != null){
            fieldName = req.getParameter("fieldName");
        }
        String sortby ="desc";
        if(req.getParameter("sortby") != null){
            sortby = req.getParameter("sortby");
        }
        Pageable pageAble =new Pageable(search,page,totalItem,fieldName,sortby);
        req.setAttribute("pageable",pageAble);
        List<Tour> tours =tourService.findAll(pageAble);
        req.setAttribute("tours",tourService.findAll(pageAble));
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
        boolean checkName = checkName(name);
        if (!checkName) {
            req.setAttribute("messageName", "Tên không được để trống");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        Date dob = Date.valueOf(req.getParameter("dob"));
        String genderS = req.getParameter("gender");
        Gender gender = Gender.valueOf(genderS);
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String cccd = req.getParameter("cccd");
        if (checkName) {
            User user = new User(userName, userPassword, name, dob, gender, phone, email, address, cccd);
            user.setRole(Role.USER);
            userService.create(user);
            req.setAttribute("message", "Tạo tài khoản thành công!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }


    public static boolean checkName(String name) {
        return !Objects.equals(name, "");
    }
}
