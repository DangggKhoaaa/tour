package ultils;

import java.util.Objects;
import java.util.regex.Pattern;

public class FormatForm {
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

    public static boolean checkPrice(String priceS) {
        try {
            double price = Double.parseDouble(priceS);
            if (price > 0)
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

    public static final String NAME_REGEX = "^[a-zA-ZÀ-Ỹà-ỹ ]+$";
    public static  boolean checkName(String name) {
        return Pattern.compile(NAME_REGEX).matcher(name).matches();
    }
    public static final String DATE_REGEX = "^(0?[1-9]|[12]\\d|3[01])[\\-](0?[1-9]|1[0-2])[\\-](19|20)\\d{2}$";

    public static boolean isDateValid(String date) {
        return Pattern.compile(DATE_REGEX).matcher(date).matches();
    }
    public static final String ADDRESS_REGEX = "^[a-zA-ZÀ-Ỹà-ỹ ./,]+$";
    public static boolean isAddressValid(String address) {
        return Pattern.compile(ADDRESS_REGEX).matcher(address).matches();
    }
    public static final String PHONE_REGEX = "^[0][0-9]{9}$";

    public static boolean isPhoneValid(String number) {
        return Pattern.compile(PHONE_REGEX).matcher(number).matches();
    }

    public static final String EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.(com|edu|net|org|biz|info|vn|pro|[A-Za-z]{2})$";

    public static boolean isEmailValid(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }
    public static final String CCCD_REGEX = "^[0][0-9]{11}$";
    public static boolean isCCCDValid(String number) {
        return Pattern.compile(CCCD_REGEX).matcher(number).matches();
    }
}
