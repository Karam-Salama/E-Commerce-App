class EndPoint {
  static String baseUrl = "https://student.valuxapps.com/api/";
  static String signIn = "login";
  static String signUp = "register";
  static String signOut = "logout";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String message = "message";
  static String data = "data";
  static String token = "token";
  static String id = "id";
  static String authorization = "Authorization";
  static String lang = "lang";

  // auth 
  static String email = "email";
  static String password = "password";
  // sign up
  static String name = "name";
  static String phone = "phone";
  static String image = "image";

  // sign in
  static String points = "points";
  static String credit = "credit";

  // sign out
  static String fcmToken = "fcm_token";

}
