package service;



import dao.UserDAO;
import dto.Pageable;
import model.User;

import java.util.List;
import java.util.Objects;
import java.util.regex.Pattern;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public List<User> findAll(Pageable pageable) {
        return userDAO.findAll(pageable);
    }
    public User findById(int id) {
        return userDAO.findById(id);
    }
    public User findByUsername(String username) {
        return userDAO.findByUsername(username);
    }
    public User findByPhone(String phone) {
        return userDAO.findByPhone(phone);
    }
    public User findByEmail(String email) {
        return userDAO.findByEmail(email);
    }
    public User findByCccd(String cccd) {
        return userDAO.findByCccd(cccd);
    }
    public void create(User user) {
        userDAO.insertUsers(user);
    }
    public void updatePassword(User user) {
        userDAO.updatePassword(user);
    }
    public void updateInfo(User user) {
        userDAO.updateInfo(user);
    }
    public void deleteUsers(int id) {
        userDAO.deleteUsers(id);
    }
    public static boolean checkString(String name) {
        return !Objects.equals(name, "");
    }

    public static boolean checkQuantity(String quanS) {
       try {
           int quan = Integer.parseInt(quanS);
           if (quan > 0 && quan <= 100)
               return true;
       } catch (Exception e) {
           return false;
       }
       return false;
    }
    public static  final String USERNAME_REGEX = "^[a-zA-Z0-9]{1,15}$";
    public static boolean checkUsername(String username) {
        return Pattern.compile(USERNAME_REGEX).matcher(username).matches();
    }
    public static final String DATE_REGEX = "\\d{2}\\\\d{2}\\\\d{4}";
    public static boolean isDateValid(String date) {
        return Pattern.compile(DATE_REGEX).matcher(date).matches();
    }
    
    public static final String PHONE_REGEX = "^[0][0-9]{9}$";

    public static boolean isPhoneValid(String number) {
        return Pattern.compile(PHONE_REGEX).matcher(number).matches();
    }
    public static final String EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
    public static boolean isEmailValid(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }
    public static final String CCCD_REGEX = "^[0][0-9]{11}$";
    public static boolean isCCCDValid(String number) {
        return Pattern.compile(CCCD_REGEX).matcher(number).matches();
    }
}
