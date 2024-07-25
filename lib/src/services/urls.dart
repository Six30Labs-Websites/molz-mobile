class Urls {
  ///base url
  // static const String baseUrl = 'https://livupbe.six30labs.com';
  //static const String baseUrl = 'https://mithram.six30labs.com';
  static const String baseUrl = 'https://molzbackend.six30labs.com';

  /// Socket Url
  // static const String socketBaseUrl = "https://chat.hapsmiths.com";
  ///base url

  static const String logIn = "$baseUrl/api/users/login";
  static const String createUser = "$baseUrl/api/users/save-user";
  static const String verifyOTP = "$baseUrl/api/users/verify/";

  static const String logInWithEmail = '$baseUrl/api/user/auth/login';
  static const String signUpWithEmail = '$baseUrl/api/user/auth/register';

  //static const String demo = 'https://randomuser.me/api/?results=3';

  //Request password reset
  static const String resetRequest = '$baseUrl/api/user/recover/reset-request';
  //Reset password
  static const String resetPassword = '$baseUrl/api/user/recover/set-password';

  static const String getUser = '$baseUrl/api/user/me';
  static const String getOfferList = '$baseUrl/api/consumer/offers';
  static const String getTestList = '$baseUrl/api/consumer/tests';
  static const String getCourseList = '$baseUrl/api/consumer/courses';

  static const String getCourseDetail = '$baseUrl/api/consumer/courses';
  static const String getTest = '$baseUrl/api/consumer/tests';
  static const String getResult = '$baseUrl/api/consumer/results';
}
