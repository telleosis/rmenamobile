class ApiConfig {
  ApiConfig._();

  static const token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImExMGExYWMxLTY0ZDItNDRlZC1hZTlkLWFkYTA0Y2Y4MDlkMiIsImVtYWlsIjoic29wcmlueWVAZ21haWwuY29tIiwicGhvbmUiOiIrMjEzMTIzNDU2NzgiLCJpYXQiOjE2OTk0Njg0MjMsImV4cCI6MTg3MjI2ODQyMywiaXNzIjoiY29tLnJoZW1hbWVuYSJ9.mClgop5cd_iHMwsgdwl4knUyyYMdOKlg4YLF1Rw7Wqg";
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
