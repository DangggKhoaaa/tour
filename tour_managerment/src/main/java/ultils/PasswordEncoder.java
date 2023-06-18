package ultils;

import org.mindrot.jbcrypt.BCrypt;

import java.util.Objects;

public class PasswordEncoder {
    public static String encode(String plainTextPassword) {
        if (!Objects.equals(plainTextPassword, "")){
            String salt = BCrypt.gensalt();
            String hashedPassword = BCrypt.hashpw(plainTextPassword, salt);
            return hashedPassword;
        }
        return "";
    }

    //kiem tra password nhap vao == passsword db
    public static boolean check(String plainTextPassword, String hashedPassword) {
        return BCrypt.checkpw(plainTextPassword, hashedPassword);
    }
}
