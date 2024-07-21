class ApiEndpoints {
  static String authBaseUrl = "https://food-api-omega.vercel.app/api/v1/user";

  /// SignIn JSON
  static String signIn = "/signin";

  /// SignUp FormData
  static String signUp = "/signup";

  /// update FormData
  static String updateData = "/update";

  /// delete user FormData
  static String deleteUser = "/delete?id=";

  /// get user passing Id as part of endPoint not as a query parameter.
  static String getUserData = "/get-user/";

  /// logOut
  static String logOut = "/logout";
}

class ApiKeys {
  static String apiKey = "apiKey=9e9e9f7e-1b5b-4b0b-9b3b-5b5b5b5b5b5b";
  static String errorMessage = "ErrorMessage";
  static String successMessage = "SuccessMessage";
  static String token = "token";
  static String userId = "userId";
  static String userName = "userName";
  static String userPassword = "userPassword";
  static String userEmail = "userEmail";
  static String userPhone = "userPhone";
  static String userAddress = "userAddress";
  static String userImage = "userImage";
  static String userRole = "userRole";
  static String userCart = "userCart";
  static String userOrders = "userOrders";
  static String userFavorites = "userFavorites";
  static String userNotifications = "userNotifications";
  static String userAddresses = "userAddresses";
  static String userAddressId = "userAddressId";
  static String userAddressTitle = "userAddressTitle";
  static String userAddressDescription = "userAddressDescription";
  static String userAddressLatitude = "userAddressLatitude";
  static String userAddressLongitude = "userAddressLongitude";
  static String userAddressCity = "userAddressCity";
  static String userAddressState = "userAddressState";
  static String userAddressCountry = "userAddressCountry";
  static String userAddressZip = "userAddressZip";
}
