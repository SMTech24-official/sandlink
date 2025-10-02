// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class StepsController extends GetxController {
//   var currentStep = 0.obs;
//   var title = "Basic Information".obs;

//   void goToStep(int step) {
//     currentStep.value = step;

//     switch (step) {
//       case 0:
//         title.value = "Basic Information";

//         break;
//       case 1:
//         title.value = "Phone Verification";

//         break;
//       case 2:
//         title.value = "Document Verification";

//         break;
//       // case 3:
//       //   title.value = "Payment Information";

//       // break;
//       case 3:
//         title.value = "Review Your Information";
//         break;
//     }
//   }

//   void nextStep() {
//     if (currentStep.value < 4) {
//       goToStep(currentStep.value + 1);
//     }
//   }

//   void backStep(int step) {
//     currentStep.value = step;
//     goToStep(step);
//   }

//   void cancelStep() {
//     if (currentStep.value > 0) {
//       goToStep(currentStep.value - 1);
//     }
//   }

//   final List<IconData> stepIcons = const [
//     Icons.person_2_outlined, // Step
//     Icons.phone_outlined, // Step
//     Icons.file_present_outlined, // Step
//     // Icons.wallet_outlined, // Step
//     Icons.check, // Step
//   ];
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandlink/features/user/join_affiliates/model/affiliate_data_model.dart';

class StepsController extends GetxController {
  var currentStep = 0.obs;
  var title = "Basic Information".obs;

  // Hold all affiliate data
  var affiliateData = AffiliateDataModel().obs;

  void updateAffiliateData(AffiliateDataModel newData) {
    affiliateData.value = newData;
  }

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
        title.value = "Review Your Information";
        break;
    }
  }

  void nextStep() {
    if (currentStep.value < 3) {
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
    Icons.person_2_outlined,
    Icons.phone_outlined,
    Icons.file_present_outlined,
    Icons.check,
  ];
}
