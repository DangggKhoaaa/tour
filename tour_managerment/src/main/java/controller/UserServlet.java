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

import java.time.LocalDate;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static service.UserService.*;
import static ultils.FormatForm.*;


@WebServlet(name = "userServlet", value = "/user")
public class UserServlet extends HttpServlet {
    TourTicketService tourTicketService = new TourTicketService();
    UserService userService = new UserService();
    int totalItem = 5;

    TourService tourService = new TourService();
    TagService tagService = new TagService();
    Tour_tagService tour_tagService = new Tour_tagService();

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
                showHOme(req, resp);
                break;
            case "cart":
                showCart(req, resp);
                break;
            case"pay":
                pay(req,resp);
                break;
            case "deleteTourTicket":
                deleteTourTicket(req, resp);
                break;
//            default:
//                showUser(req, resp);
        }
    }

    public void showCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        User user = userService.findById(user_id);
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName = "tour_ticket_id";
        if (req.getParameter("fieldName") != null) {
            fieldName = req.getParameter("fieldName");
        }
        String sortby = "desc";
        if (req.getParameter("sortby") != null) {
            sortby = req.getParameter("sortby");
        }

        Pageable pageAble =new Pageable(search,page,totalItem,fieldName,sortby);
        tourTicketService.deleteOutOfDate();
        List<TourTicket> tourTickets= tourTicketService.findAllByUserId(pageAble,user);
        req.setAttribute("user",user);
        Pageable p =pageAble;
        req.setAttribute("tourTickets",tourTickets);
        req.setAttribute("pageable",pageAble);
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
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName = "t1.tour_id";
        if (req.getParameter("fieldName") != null) {
            fieldName = req.getParameter("fieldName");
        }
        String sortby = "desc";
        if (req.getParameter("sortby") != null) {
            sortby = req.getParameter("sortby");
        }

        Pageable pageAble = new Pageable(search, page, totalItem, fieldName, sortby);
        req.setAttribute("pageable", pageAble);
        req.setAttribute("tours", tourService.findAll(pageAble));
        req.getRequestDispatcher("home.jsp").forward(req, resp);
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
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName = "t1.tour_id";
        if (req.getParameter("fieldName") != null) {
            fieldName = req.getParameter("fieldName");
        }
        String sortby = "desc";
        if (req.getParameter("sortby") != null) {
            sortby = req.getParameter("sortby");
        }
        Pageable pageAble = new Pageable(search, page, totalItem, fieldName, sortby);
        req.setAttribute("pageable", pageAble);
        List<Tour> tours = tourService.findAll(pageAble);
        req.setAttribute("tours", tourService.findAll(pageAble));
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
        boolean checkEmptyName = checkString(name);
        boolean checkName = checkName(name);
        if (!checkEmptyName) {
            req.setAttribute("messageName", "Họ và tên không được để trống");
        } else if (!checkName) {
            req.setAttribute("messageName", "Họ và tên không được có kí tự đặc biệt");
        }
        String dobS = req.getParameter("dob");
        boolean checkDob = true;
        Date dob = null;
        if (dobS == null || dobS.equals("")) {
            checkDob = false;
            req.setAttribute("messageDob", "Vui lòng chọn ngày sinh hợp lệ");
        } else {
            dob = Date.valueOf(req.getParameter("dob"));
            if (dob.compareTo(new java.util.Date()) > 0) {
                checkDob = false;
                req.setAttribute("messageDob", "Không được chọn ngày quá ngày hiện tại");
            }
        }
        String genderS = req.getParameter("gender");
        Gender gender = Gender.valueOf(genderS);
        String phone = req.getParameter("phone");
        boolean checkEmptyPhone = checkString(phone);
        boolean checkPhone = isPhoneValid(phone);
        User userPhone = userService.findByPhone(phone);
        User userId = userService.findById(id);
        if (!checkEmptyPhone) {
            req.setAttribute("messagePhone", "Số điện thoại không được để trống");
        } else if (!checkPhone) {
            req.setAttribute("messagePhone", "Số điện thoại gồm 10 số bắt đầu bằng số 0");
        } else if (userPhone != null && !Objects.equals(userId.getPhone(), phone)) {
            req.setAttribute("messagePhone", "Số điện thoại đã tồn tại");
        }
        String email = req.getParameter("email");
        boolean checkEmptyEmail = checkString(email);
        boolean checkEmail = isEmailValid(email);
        User userEmail = userService.findByEmail(email);
        if (!checkEmptyEmail) {
            req.setAttribute("messageEmail", "Email không được để trống");
        } else if (!checkEmail) {
            req.setAttribute("messageEmail", "Email không hợp lệ");
        } else if (userEmail != null && !Objects.equals(userId.getEmail(), email)) {
            req.setAttribute("messageEmail", "Email đã tồn tại");
        }
        String address = req.getParameter("address");
        boolean checkEmptyAddress = checkString(address);
        boolean checkAddress = isAddressValid(address);
        if (!checkEmptyAddress) {
            req.setAttribute("messageAddress", "Địa chỉ không được để trống");
        } else if (!checkAddress) {
            req.setAttribute("messageAddress", "Địa chỉ không được dùng kí tự đặc biệt ngoài ',' '.' '/'");
        }
        String cccd = req.getParameter("cccd");
        boolean checkEmptyCccd = checkString(cccd);
        boolean checkCCCD = isCCCDValid(cccd);
        User userCccd = userService.findByCccd(cccd);
        if (!checkEmptyCccd) {
            req.setAttribute("messageCccd", "Căn cước công dân không được để trống");
        } else if (!checkCCCD) {
            req.setAttribute("messageCccd", "Căn cước công dân gồm 12 số bắt đầu bằng số 0");
        } else if (userCccd != null && !Objects.equals(userId.getCccd(), cccd)) {
            req.setAttribute("messageCccd", "Căn cước công dân đã tồn tại");
        }
        if (checkEmptyName && checkName && checkDob && checkEmptyPhone && checkPhone && (userPhone == null || Objects.equals(userId.getPhone(), phone)) && checkEmptyEmail && checkEmail && (userEmail == null || Objects.equals(userId.getEmail(), email)) && checkEmptyAddress && checkAddress && checkEmptyCccd && checkCCCD && (userCccd == null || Objects.equals(userId.getCccd(), cccd))) {
            User user = new User(id, name, dob, gender, phone, email, address, cccd);
            userService.updateInfo(user);
            req.setAttribute("message", "Đổi thông tin thành công!");
            req.setAttribute("genders", Gender.values());
            req.setAttribute("user", user);
            req.getRequestDispatcher("/information.jsp").forward(req, resp);
        } else {
            User user = userService.findById(id);
            req.setAttribute("genders", Gender.values());
            req.setAttribute("user", user);
            req.getRequestDispatcher("/updateInfo.jsp").forward(req, resp);
        }
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
        User username = userService.findByUsername(userName);
        boolean checkEmptyUsername = checkString(userName);
        boolean checkUsername = checkUsername(userName);
        if (!checkEmptyUsername) {
            req.setAttribute("messageUsername", "Tài khoản không được để trống");
        } else if (!checkUsername) {
            req.setAttribute("messageUsername", "Tài khoản không có kí tự đặc biệt và ngắn hơn 15 kí tự");
        } else if (username != null) {
            req.setAttribute("messageUsername", "Tài khoản đã tồn tại");
        }

        String userPassword = PasswordEncoder.encode(req.getParameter("user_password"));
        boolean checkEmptyPassword = checkString(userPassword);
        if (!checkEmptyPassword) {
            req.setAttribute("messagePassword", "Mật khẩu không được để trống");
        }
        String name = req.getParameter("full_name");
        boolean checkEmptyName = checkString(name);
        boolean checkName = checkName(name);
        if (!checkEmptyName) {
            req.setAttribute("messageName", "Họ và tên không được để trống");
        } else if (!checkName) {
            req.setAttribute("messageName", "Họ và tên không được có kí tự đặc biệt");
        }
        String dobS = req.getParameter("dob");
        boolean checkDob = true;
        Date dob = null;
        if (dobS == null || dobS.equals("")) {
           checkDob = false;
            req.setAttribute("messageDob", "Vui lòng chọn ngày sinh hợp lệ");
        } else {
            dob = Date.valueOf(req.getParameter("dob"));
            if (dob.compareTo(new java.util.Date()) > 0) {
                checkDob = false;
                req.setAttribute("messageDob", "Không được chọn ngày quá ngày hiện tại");
            }
        }
        String genderS = req.getParameter("gender");
        Gender gender = Gender.valueOf(genderS);
        String phone = req.getParameter("phone");
        boolean checkEmptyPhone = checkString(phone);
        boolean checkPhone = isPhoneValid(phone);
        User userPhone = userService.findByPhone(phone);
        if (!checkEmptyPhone) {
            req.setAttribute("messagePhone", "Số điện thoại không được để trống");
        } else if (!checkPhone) {
            req.setAttribute("messagePhone", "Số điện thoại gồm 10 số bắt đầu bằng số 0");
        } else if (userPhone != null) {
            req.setAttribute("messagePhone", "Số điện thoại đã tồn tại");
        }
        String email = req.getParameter("email");
        boolean checkEmptyEmail = checkString(email);
        boolean checkEmail = isEmailValid(email);
        User userEmail = userService.findByEmail(email);
        if (!checkEmptyEmail) {
            req.setAttribute("messageEmail", "Email không được để trống");
        } else if (!checkEmail) {
            req.setAttribute("messageEmail", "Email không hợp lệ(tên miền chỉ hỗ trợ các dạng .com|edu|net|org|biz|info|pro) hoặc tên miền quốc gia ví dụ .vn,...");
        } else if (userEmail != null) {
            req.setAttribute("messageEmail", "Email đã tồn tại");
        }
        String address = req.getParameter("address");
        boolean checkEmptyAddress = checkString(address);
        boolean checkAddress = isAddressValid(address);
        if (!checkEmptyAddress) {
            req.setAttribute("messageAddress", "Địa chỉ không được để trống");
        } else if (!checkAddress) {
            req.setAttribute("messageAddress", "Địa chỉ không được dùng kí tự đặc biệt ngoài ',' '.' '/'");
        }
        String cccd = req.getParameter("cccd");
        boolean checkEmptyCccd = checkString(cccd);
        boolean checkCCCD = isCCCDValid(cccd);
        User userCccd = userService.findByCccd(cccd);
        if (!checkEmptyCccd) {
            req.setAttribute("messageCccd", "Căn cước công dân không được để trống");
        } else if (!checkCCCD) {
            req.setAttribute("messageCccd", "Căn cước công dân gồm 12 số bắt đầu bằng số 0");
        } else if (userCccd != null) {
            req.setAttribute("messageCccd", "Căn cước công dân đã tồn tại");
        }
        if (!checkEmptyUsername || !checkUsername || username != null || !checkEmptyPassword || !checkEmptyName || !checkName || !checkEmptyPhone || !checkPhone || userPhone != null || !checkEmptyEmail || !checkEmail || userEmail != null || !checkEmptyAddress || !checkAddress || !checkEmptyCccd || !checkCCCD || userCccd != null || !checkDob) {
            User oldUser = new User(userName, userPassword, name, dob, gender, phone, email, address, cccd);
            req.setAttribute("user", oldUser);
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        if (checkEmptyUsername && checkUsername && username == null && checkEmptyPassword && checkEmptyName && checkName && checkEmptyPhone && checkPhone && userPhone == null && checkEmptyEmail && checkEmail && userEmail == null && checkEmptyAddress && checkAddress && checkEmptyCccd && checkCCCD && userCccd == null && checkDob) {
            User newUser = new User(userName, userPassword, name, dob, gender, phone, email, address, cccd);
            newUser.setRole(Role.USER);
            userService.create(newUser);
            req.setAttribute("message", "Tạo tài khoản thành công!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}
