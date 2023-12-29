import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse('https://xcod33.com/'));
    return Scaffold(appBar: CustomAppBar(), body: WebViewWidget(controller: controller),);
  }
}