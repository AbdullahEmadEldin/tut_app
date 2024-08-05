// ignore_for_file: prefer_interpolation_to_compose_strings

class ApiEndpoints {
  //*=============================================*//
  //**===============Auth EndPoints===============*//
  //*=============================================*//

  static String authBaseUrl = "https://food-api-omega.vercel.app/api/v1/user";

  /// SignIn JSON
  static String signIn = authBaseUrl + "/signin";

  /// SignUp FormData
  static String signUp = authBaseUrl + "/signup";

  /// update FormData
  static String updateData = authBaseUrl + "/update";

  /// delete user FormData
  static String deleteUser = authBaseUrl + "/delete?id=";

  /// get user passing Id as part of endPoint not as a query parameter.
  static String getUserData = authBaseUrl + "/get-user/";

  /// logOut
  static String logOut = authBaseUrl + "/logout";

  //*===========================================================*/
  //**=============== GOOGLE Books Api-EndPoints=============== */
  //*===========================================================*/

  static String googleBooksBaseUrl =
      "https://www.googleapis.com/books/v1/volumes?";
  //? query parameters
  static const String query = "q";
  static const String qLangParam = "langRestrict";
  static const String qStartIndex = "startIndex";
  static const String qMaxResults = "maxResults";
  static const String qOrderBy = "orderBy";
  static const String qProjection =
      "projection"; // for getting books with valid data only
  static const String fullVolumeInfo = 'full';
  static const String trending = "";
}

class ApiKeys {
  static String errorMessage = "ErrorMessage";
  static String message = "message";
  static String token = "token";
  static String userId = "id";

  //**===============Sign Up Keys=============== */
  static String userName = "name";
  static String email = "email";
  static String password = "password";
  static String confirmPassword = "confirmPassword";
  static String phoneNum = "phone";
  static String profilePic = "profilePic";

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
