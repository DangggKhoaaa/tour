package dao;



import dto.Pageable;
import model.Gender;
import model.Role;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends ConectionDatabase{
    private final String SELECT_USERS = "SELECT * FROM user WHERE lower(full_name) LIKE ? OR lower(user_name) LIKE ? OR lower(gender) LIKE ? OR lower(phone) LIKE ? OR lower(email) LIKE ? OR lower(address) LIKE ? OR lower(cccd) LIKE ? OR lower(role) LIKE ? LIMIT ? OFFSET ?";
    private final String SELECT_USERS_BY_ID = "SELECT * FROM user WHERE user_id = ?";
    private final String SELECT_USERS_BY_USERNAME = "SELECT * FROM user WHERE user_name = ?";
    private final String SELECT_USERS_BY_PHONE = "SELECT * FROM user WHERE phone = ?";
    private final String SELECT_USERS_BY_EMAIL = "SELECT * FROM user WHERE email = ?";
    private final String SELECT_USERS_BY_CCCD = "SELECT * FROM user WHERE cccd = ?";
    private final String INSERT_USERS = "INSERT INTO user (user_name, user_password, full_name, dob, gender, phone, email, address, cccd, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String UPDATE_PASSWORD = "UPDATE user SET user_password = ? WHERE user_id = ?";
    private final String UPDATE_INFO = "UPDATE user SET full_name = ?, dob = ?, gender = ?, phone = ?, email = ?, address = ?, cccd = ? WHERE user_id = ?";
    private final String DELETE_USERS = "DELETE FROM user WHERE user_id = ?";
    private final String TOTAL_USERS = "SELECT COUNT(*) AS total FROM user u WHERE lower(u.full_name) LIKE ? OR lower(u.user_name) LIKE ? OR lower(u.gender) LIKE ? OR lower(u.phone) LIKE ? OR lower(u.email) LIKE ? OR lower(u.address) LIKE ? OR lower(u.cccd) LIKE ? OR lower(u.role) LIKE ?";
    public List<User> findAll(Pageable pageable) {
        List<User> users = new ArrayList<>();
        String search = pageable.getSearch();
        if (search == null)
            search = "";
        search = "%" + search + "%";
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_USERS)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setString(3, search);
            preparedStatement.setString(4, search);
            preparedStatement.setString(5, search);
            preparedStatement.setString(6, search);
            preparedStatement.setString(7, search);
            preparedStatement.setString(8, search);
            preparedStatement.setInt(9, pageable.getTotalItems());
            preparedStatement.setInt(10, (pageable.getPage() - 1) * pageable.getTotalItems());

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("user_id");
                String nameUser = rs.getString("user_name");
                String password = rs.getString("user_password");
                String name = rs.getString("full_name");
                Date dob = rs.getDate("dob");

                String genderS = rs.getString("gender");
                Gender gender = Gender.valueOf(genderS);

                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String cccd = rs.getString("cccd");

                String roleS = rs.getString("role");
                Role role = Role.valueOf(roleS);
                users.add(new User(id, nameUser, password, name, dob, gender, phone, email, address, cccd, role));
            }
            //Tổng số trang
            PreparedStatement statementTotalUsers =connection.prepareStatement(TOTAL_USERS);
            statementTotalUsers.setString(1, search);
            statementTotalUsers.setString(2, search);
            statementTotalUsers.setString(3, search);
            statementTotalUsers.setString(4, search);
            statementTotalUsers.setString(5, search);
            statementTotalUsers.setString(6, search);
            statementTotalUsers.setString(7, search);
            statementTotalUsers.setString(8, search);
            ResultSet rsTotalUser = statementTotalUsers.executeQuery();
            while (rsTotalUser.next()){
                double totalUsers = rsTotalUser.getDouble("total");
                double totalItems = Double.parseDouble(pageable.getTotalItems() + "");
                int totalPages = (int) Math.ceil(totalUsers/totalItems);
                pageable.setTotalPage(totalPages);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return users;
    }
    public User findById(int id) {
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_USERS_BY_ID);) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idCus = rs.getInt("user_id");
                String nameUser = rs.getString("user_name");
                String password = rs.getString("user_password");
                String name = rs.getString("full_name");
                Date dob = rs.getDate("dob");
                String genderS = rs.getString("gender");
                Gender gender = Gender.valueOf(genderS);
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String cccd = rs.getString("cccd");

                String roleS = rs.getString("role");
                Role role = Role.valueOf(roleS);
                return new User(idCus, nameUser, password, name, dob, gender, phone, email, address, cccd, role);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public User findByUsername(String username) {
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_USERS_BY_USERNAME);) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, username);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idCus = rs.getInt("user_id");
                String nameUser = rs.getString("user_name");
                String password = rs.getString("user_password");
                String name = rs.getString("full_name");
                Date dob = rs.getDate("dob");
                String genderS = rs.getString("gender");
                Gender gender = Gender.valueOf(genderS);
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String cccd = rs.getString("cccd");

                String roleS = rs.getString("role");
                Role role = Role.valueOf(roleS);
                return new User(idCus, nameUser, password, name, dob, gender, phone, email, address, cccd, role);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public User findByPhone(String phone) {
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_USERS_BY_PHONE);) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, phone);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idCus = rs.getInt("user_id");
                String nameUser = rs.getString("user_name");
                String password = rs.getString("user_password");
                String name = rs.getString("full_name");
                Date dob = rs.getDate("dob");
                String genderS = rs.getString("gender");
                Gender gender = Gender.valueOf(genderS);
                String phone2 = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String cccd = rs.getString("cccd");

                String roleS = rs.getString("role");
                Role role = Role.valueOf(roleS);
                return new User(idCus, nameUser, password, name, dob, gender, phone2, email, address, cccd, role);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public User findByEmail(String email) {
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_USERS_BY_PHONE);) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, email);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idCus = rs.getInt("user_id");
                String nameUser = rs.getString("user_name");
                String password = rs.getString("user_password");
                String name = rs.getString("full_name");
                Date dob = rs.getDate("dob");
                String genderS = rs.getString("gender");
                Gender gender = Gender.valueOf(genderS);
                String phone = rs.getString("phone");
                String email2 = rs.getString("email");
                String address = rs.getString("address");
                String cccd = rs.getString("cccd");

                String roleS = rs.getString("role");
                Role role = Role.valueOf(roleS);
                return new User(idCus, nameUser, password, name, dob, gender, phone, email2, address, cccd, role);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public User findByCccd(String cccd) {
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_USERS_BY_PHONE);) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, cccd);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int idCus = rs.getInt("user_id");
                String nameUser = rs.getString("user_name");
                String password = rs.getString("user_password");
                String name = rs.getString("full_name");
                Date dob = rs.getDate("dob");
                String genderS = rs.getString("gender");
                Gender gender = Gender.valueOf(genderS);
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String cccd2 = rs.getString("cccd");

                String roleS = rs.getString("role");
                Role role = Role.valueOf(roleS);
                return new User(idCus, nameUser, password, name, dob, gender, phone, email, address, cccd2, role);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public void insertUsers(User user) {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setDate(4, user.getDob());
            preparedStatement.setString(5, String.valueOf(user.getGender()));
            preparedStatement.setString(6, user.getPhone());
            preparedStatement.setString(7, user.getEmail());
            preparedStatement.setString(8, user.getAddress());
            preparedStatement.setString(9, user.getCccd());
            preparedStatement.setString(10, user.getRole().toString());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updatePassword(User user) {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PASSWORD)) {
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setInt(2, user.getId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateInfo(User user) {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_INFO)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setDate(2, user.getDob());
            preparedStatement.setString(3, String.valueOf(user.getGender()));
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getCccd());
            preparedStatement.setInt(8, user.getId());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void deleteUsers(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USERS)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
