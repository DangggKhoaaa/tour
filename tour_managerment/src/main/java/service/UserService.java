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

}
