
class UserData {
  // Predefined user data for development
  static String firstName = "Waqar";
  static String lastName = "Ali";
  static String email = "abc@xyz.com";
  
  // If you have other fields like password or phone number, 
  // you can pre-fill them here as well:
  static String password = "123";

  static bool isRegistered = false;

  // =========================================================
  // SAVE USER
  // =========================================================

  static void saveUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) {
    UserData.email = email;
    UserData.firstName = firstName;
    UserData.lastName = lastName;
    UserData.password = password;

    UserData.isRegistered = true;
  }

  // =========================================================
  // CHECK LOGIN
  // =========================================================

  static bool checkLogin({
    required String email,
    required String password,
  }) {
    if (!isRegistered) {
      return false;
    }

    return UserData.email == email &&
        UserData.password == password;
  }

  // =========================================================
  // CLEAR USER
  // =========================================================

  static void clearUser() {
    email = "";
    firstName = "";
    lastName = "";
    password = "";

    isRegistered = false;
  }
}
