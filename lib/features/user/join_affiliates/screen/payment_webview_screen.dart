// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:webview_flutter/webview_flutter.dart';

// class PaymentWebviewScreen extends StatelessWidget {
//   const PaymentWebviewScreen({
//     super.key,
//     required this.paymentUrl,
//     this.onBackButtonTap,
//   });

//   final String paymentUrl;
//   final VoidCallback? onBackButtonTap;

//   @override
//   Widget build(BuildContext context) {
//     final webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse(paymentUrl));

//     final uri = Uri.tryParse(paymentUrl);
//     final isValidUrl =
//         uri != null && (uri.isScheme('http') || uri.isScheme('https'));

//     if (!isValidUrl) {
//       return Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               const Expanded(
//                 child: Center(
//                   child: Text(
//                     'Invalid or missing payment URL.',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             // Get.to(() => NavBar());
//             Get.back();
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SafeArea(child: WebViewWidget(controller: webViewController)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandlink/core/app_colors/app_colors.dart';
import 'package:sandlink/core/config/constants/assets_paths/icons_assets_paths.dart';
import 'package:sandlink/core/widgets/custom_button.dart';
import 'package:sandlink/features/user/join_affiliates/screen/steps_screen.dart';
import 'package:sandlink/features/user/join_affiliates/screen/widgets/subs_custom_show_dialog.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewScreen extends StatelessWidget {
  const PaymentWebviewScreen({
    super.key,
    required this.paymentUrl,
    this.onBackButtonTap,
  });

  final String paymentUrl;
  final VoidCallback? onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) async {
            if (url ==
                "http://206.162.244.143:5000/payment-success?isSubscriptionPaymentSuccess=true") {
              Get.to(() => StepsScreen());
              // paymentButton();
            } else if (url ==
                "http://206.162.244.143:5000/payment-cancel/isSubscriptionPaymentSuccess=false") {
              Get.back();
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(paymentUrl));

    final uri = Uri.tryParse(paymentUrl);
    final isValidUrl =
        uri != null && (uri.isScheme('http') || uri.isScheme('https'));

    if (!isValidUrl) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    'Invalid or missing payment URL.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      // ),
      body: SafeArea(child: WebViewWidget(controller: webViewController)),
    );
  }
}

Widget paymentButton() {
  return CustomButton(
    onPressed: () => subCustomPaySuccess(
      imagePath: IconsAssetsPaths.instance.successimage,
      title: 'Successful',
      subtitle: 'Your payment is Successful',

      colorbutton1: AppColors.whiteColor,
      colorbutton2: AppColors.lightGrey,

      // primaryButtonText: 'View Order',
      primaryButton: () {},
      secondaryButtonText: 'Go next',
      secondaryButton: () => Get.offAll(() => StepsScreen()),
    ),

    text: 'Payment Now',
  );
}
