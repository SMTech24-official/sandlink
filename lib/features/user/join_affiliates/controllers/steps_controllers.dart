import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class StepsController extends GetxController{

  var currentStep = 0.obs;
  var title = "Basic Information".obs;

  void goToStep(int step) {
    currentStep.value = step;

    switch (step) {
      case 0:
        title.value = "Basic Information";

        break;
      case 1:
        title.value = "Phone Verification";

        break;
      case 2:
        title.value = "Document Verification";

        break;
      case 3:
        title.value = "Payment Information";

        break;
      case 4:
        title.value = "Review Your Information";
        break;
    }
  }

  void nextStep() {
    if (currentStep.value < 4) {
      goToStep(currentStep.value + 1);
    }
  }

  void backStep(int step) {
    currentStep.value = step;
    goToStep(step);
  }
  void cancelStep() {

    if (currentStep.value > 0) {
      goToStep(currentStep.value - 1);
    }
  }

  final List<IconData> stepIcons = const [
    Icons.person_2_outlined, // Step 1
    Icons.phone_outlined,   // Step 2
    Icons.file_present_outlined,// Step 3
    Icons.wallet_outlined,// Step 4
    Icons.check,  // Step 5
  ];


}