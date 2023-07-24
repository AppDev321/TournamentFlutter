class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://192.168.56.172:80/tournament/api/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // post endpoints
  static const String getPosts = baseUrl + "/posts";

  // auth endpoints
  static const String login = baseUrl + 'user_login';
  static const String register = baseUrl + '/register';
  static const String logout = baseUrl + '/logout';
  static const String forgotPassword = baseUrl + '/forgot-password';
  static const String resetPassword = baseUrl + '/reset-password';
}
