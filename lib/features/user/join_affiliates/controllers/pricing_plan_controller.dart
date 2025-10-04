import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/config/api_end_points/api_end_points.dart';
import 'package:sandlink/core/network/network_caller.dart';
import 'package:sandlink/core/services/DBServices/local_db_services/storage_service.dart';
import 'package:sandlink/features/user/join_affiliates/screen/payment_webview_screen.dart';

import '../model/pricing_plan_model.dart';

class PricingPlanController extends GetxController {
  RxList<SubscriptionPlan> subscriptionPlanList = <SubscriptionPlan>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchSubscriptionPlanData();
  }

  Future<void> fetchSubscriptionPlanData() async {
    EasyLoading.show(status: 'Loading...');
    // debugPrint(extendedUrl);
    try {
      var url = ApiEndPoints.pricingPlan;

      final response = await NetworkCaller().getRequest(
        url,
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        final subscriptionPlanData = Data.fromJson(response.responseData);

        subscriptionPlanList.value = subscriptionPlanData.result ?? [];
      } else {
        EasyLoading.showError(response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError('Failed! Please try again');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> purchaseSubscriptionPlan(String subscriptionPlanId) async {
    EasyLoading.show(status: 'Loading...');

    try {
      var url = ApiEndPoints.purchaseSubscriptionPlan;

      final response = await NetworkCaller().postRequest(
        url,
        body: {"subscriptionPlanId": subscriptionPlanId.toString()},
        token: StorageService().getData('accessToken'),
      );

      if (response.isSuccess) {
        final stripeUrl = response.responseData['url'];
        Get.to(() => PaymentWebviewScreen(paymentUrl: stripeUrl));
      } else {
        EasyLoading.showError(response.errorMessage);
      }
    } catch (e) {
      EasyLoading.showError('Failed! Please try again');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
