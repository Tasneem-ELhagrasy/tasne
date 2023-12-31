class EndPoints {
  static const baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const signIn = 'chef/signin';
  static const chefGEt = 'chef/get-chef/';
  static const sendCode = 'chef/send-code';
  static const forgetPassChange = 'chef/change-forgotten-password';
  static const passChange = 'chef/change-password';
  static const update = 'chef/update';
  static const addMeal = 'meal/add-to-menu';
  static const updateMeal = 'chef/update-meal/';
  static const deleteMEal = 'meal/delete-meal/';
  static const getAllMeal = 'meal/get-meals';
  static const logout = 'chef/logout';

  static String chefGetEndPoint(id) {
    return '$chefGEt$id';
  }

  static String updateMealEndPoint(id) {
    return '$updateMeal$id';
  }

  static String deleteMealEndPoint(id) {
    return '$updateMeal$id';
  }
}

class ApiKeys {
  static String email = "email";
  static String password = "password";
  static String oldPass = "oldPass";
  static String newPass = "password";
  static String confirmPassword = "confirmPassword";
  static String code = "code";
  static String message = "message";
  static String token = "token";
}
