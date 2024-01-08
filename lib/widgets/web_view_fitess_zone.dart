import 'package:active_ally_fitness_zone_250/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFitnessZone extends StatefulWidget {
  final String url;
  final String title;

  const WebFitnessZone({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WebFitnessZone> createState() => _WebFitnessZoneState();
}

class _WebFitnessZoneState extends State<WebFitnessZone> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarFitessZone(title: widget.title),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
