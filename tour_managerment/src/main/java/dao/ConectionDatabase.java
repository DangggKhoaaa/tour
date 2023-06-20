package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectionDatabase {
    protected String jdbcURL = "jdbc:mysql://localhost:3306/tour";
    protected String jdbcUsername = "root";

<<<<<<< Updated upstream
    protected String jdbcPassword = "Kutronboy2701";
=======
    protected String jdbcPassword = "0766784418";


>>>>>>> Stashed changes


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
