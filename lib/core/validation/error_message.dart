
class ErrorMessage{


  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? nameValidation(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone number is required";
    }
    if (!RegExp(r'^[0-9]{10,15}$').hasMatch(phone)) {
      return "Enter a valid phone number";
    }
    return null;
  }




}