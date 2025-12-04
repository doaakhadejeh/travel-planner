class ApiLink {
  static const String baseUri = "http://192.168.43.190:8000/api";

  // ------------------ Auth ------------------
  static const String login = "$baseUri/login";
  static const String signin = "$baseUri/register";
  static const String forgotPassword = "$baseUri/forgotPassword";
  static const String resetPassword = "$baseUri/resetPassword";
  static const String verifyCode = "$baseUri/verifyCode";
  static const String resendVerificationCode =
      "$baseUri/resendVerificationCode";

  //------------------admin------------------
  static const String getalluser = "$baseUri/alluser";
  static String toggleBlockUser(int userId) =>
      "$baseUri/toggleBlockUser/$userId";

  //-------------------user------------------
  static const String getprofile = "$baseUri/profile";
  static const String updateProfile = "$baseUri/updateProfile";
  static const String changePassword = "$baseUri/changePassword";
  static const String updateProfileImage = "$baseUri/updateProfileImage";

  //------------------Activity-------------------
  static String showActivity(int id) => "$baseUri/showActivity/$id";
  static String showActivities(int dayId) =>
      "$baseUri/showActivities/$dayId/day";
  static String destroyActivity(int id) => "$baseUri/destroy/$id/activity";

  //-----------------ItineraryDay---------------
  static String showDay(int id) => "$baseUri/showDay/$id";
  static String showDaysTrip(int tripId) => "$baseUri/showDays/$tripId/trip";
  static String destroyDay(int id) => "$baseUri/delete/$id/day";

  //------------------Trip--------------------------
  static String tripDetails(int id) => "$baseUri/tripDetails/$id";
  static String destroyTrip(int id) => "$baseUri/delete/$id/trip";
  static const String userTrips = "$baseUri/userTrips";
  static const String generateTrip = "$baseUri/generateTrip";

  //-------------------UserPreference----------------------
  static String showPreference(int id) => "$baseUri/preference/$id";
  static String updatePreference(int id) => "$baseUri/preference/$id";
  static String destroyPreference(int id) => "$baseUri/preference/$id";
  static const String getPreference = "$baseUri/preference";
  static const String storePreference = "$baseUri/preference";

  //-------------------Favourite----------------------
  static String addFavorite(int tripId) => "$baseUri/favorite/add/$tripId";
  static String removeFavorite(int tripId) =>
      "$baseUri/favorite/remove/$tripId";
  static String isFavorite(int tripId) => "$baseUri/favorite/check/$tripId";
  static const String myFavorites = "$baseUri/favorite/list";
}
