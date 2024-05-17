class ApiConfig {
  ApiConfig._();

  static const token = "";
  static const String baseUrl = "https://api.dev.rhemamena.com";
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String user = '/profiles/me';
  static const String forgotPassword = '/auth/forgot-password';
  static const String updatePassword = '/auth/reset-password';
  static const String resetPassword = '/auth/reset-password';
  static const String courseList = '/courses';
  static const String getCourse = '/cources/:id';
  static const String classList = '/class-schedules';
  static const String getClass =
      '/class-schedules/course/:course/campus/:campus';
  static const String resourcesList = '/resources';
  static const String getResource = '/resources/:id';
  static const header = {
    'Authorization': 'Bearer $token',
    'content-Type': 'application/json',
  };
}
