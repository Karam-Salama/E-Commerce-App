class EndPoint {
  static String baseUrl = "https://student.valuxapps.com/api/";
  static String signIn = "login";
  static String signUp = "register";
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

  // auth 
  static String email = "email";
  static String password = "password";
  // sign up
  static String name = "name";
  static String phone = "phone";
  static String image = "image";

  // sign in

}
