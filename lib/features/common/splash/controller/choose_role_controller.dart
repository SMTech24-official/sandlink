import 'package:get/get.dart';

class ChooseRoleController extends GetxController {
  var selectedRole = " ".obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  //
  // void riderBasicScreen(String role){
  //    if(role == 'rider'){
  //      Get.to(()=>RiderPersonalInformationScreen());
  //    }
  //
  // }
}
