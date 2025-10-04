class ApiEndPoints {
  ApiEndPoints._();

  static const _baseUrl = 'http://206.162.244.143:5000/api/v1';
  static const register = '$_baseUrl/auth/register';
  static const login = '$_baseUrl/auth/login';
  static const verifyforgetpassword =
      '$_baseUrl/auth/verify-otp-forget-password';
  static const forgotpassword = '$_baseUrl/auth/forget-password';

  // Account Verify//
  static const verifyotp = '$_baseUrl/auth/verify-otp';
  static const resendotp = '$_baseUrl/auth/send-otp-email';
  static const verifyuserbyemail = '$_baseUrl/auth/verify-user-by-email';

  //Home categories and Most Popular
  static const categories = '$_baseUrl/categories';
  static const mostPopular = '$_baseUrl/products/most-popular';
  // User Profile Update //

  static const editProfileUpdate = "$_baseUrl/users/update-profile";
  static const getUserProfile = "$_baseUrl/users/single-user-details";

  // added by mahmud
  static const addAddress = '$_baseUrl/users/create-address';
  static const getAddress = '$_baseUrl/users/single-address';
  static const deleteadress = '$_baseUrl/users/delete-address';
  static const updateAddress = '$_baseUrl/users/update-address';
  static const deleteaccunt = '$_baseUrl/users/delete-account';
  static const productdetails = '$_baseUrl/products/details';
  static const addtocard = '$_baseUrl/carts/add';

  //Lokman
  static const pricingPlan = '$_baseUrl/subscription-plans';

  // added by shahriar
  static const allProducts = '$_baseUrl/products';

  static const sendPhoneOtp = '$_baseUrl/sellers/basic-info';
  static const verifyPhoneOtp = '$_baseUrl/auth/verify-otp-by-phone-number';
}
