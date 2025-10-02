import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DocumentVerificationController extends GetxController {
  Rx<File?> nidFrontImage = Rx<File?>(null);
  Rx<File?> nidBackImage = Rx<File?>(null);
  Rx<File?> licenceImage = Rx<File?>(null);
  Rx<File?> tinImage = Rx<File?>(null);
  Rx<File?> addressImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(String documentType) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        switch (documentType) {
          case 'nidFront':
            nidFrontImage.value = File(pickedFile.path);
            break;
          case 'nidBack':
            nidBackImage.value = File(pickedFile.path);
            break;
          case 'licence':
            licenceImage.value = File(pickedFile.path);
            break;
          case 'tin':
            tinImage.value = File(pickedFile.path);
            break;
          case 'address':
            addressImage.value = File(pickedFile.path);
            break;
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error picking image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeImage(String documentType) {
    switch (documentType) {
      case 'nidFront':
        nidFrontImage.value = null;
        break;
      case 'nidBack':
        nidBackImage.value = null;
        break;
      case 'licence':
        licenceImage.value = null;
        break;
      case 'tin':
        tinImage.value = null;
        break;
      case 'address':
        addressImage.value = null;
        break;
    }
  }
}
