import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController{

  final box = GetStorage();

  var quantity = 1.obs;

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }


  var cartItems = <Map<String, dynamic>>[].obs;





}