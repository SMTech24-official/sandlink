import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SubmitWebview extends StatelessWidget {
  const SubmitWebview({
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Get.to(() => NavBar());
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(child: WebViewWidget(controller: webViewController)),
    );
  }
}
