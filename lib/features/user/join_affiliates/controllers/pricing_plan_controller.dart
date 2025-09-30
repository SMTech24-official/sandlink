import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/config/constants/assets_paths/icons_assets_paths.dart';
import '../model/pricing_plan_model.dart';

class PricingPlanController extends GetxController {
  final List<PricingPlanModel> purchasePlanList = [
    PricingPlanModel(
      imageUrl: IconsAssetsPaths.instance.purchesicon,
      planType: 'Basic plan',
      planDetails:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
      amount: '10',
      packageType: 'Week',
      planID: 0,
    ),
    PricingPlanModel(
      imageUrl: IconsAssetsPaths.instance.purchesicon,
      planType: 'Standard',
      planDetails:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
      amount: '25',
      packageType: 'Month',
      planID: 1,
    ),
    PricingPlanModel(
      imageUrl: IconsAssetsPaths.instance.purchesicon,
      planType: 'Premium',
      planDetails:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
      amount: '300',
      packageType: 'Year',
      planID: 2,
    ),
  ];
}
