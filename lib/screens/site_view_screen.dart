import 'package:flutter/material.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SiteViewScreen extends StatelessWidget {
  final SiteModel site;

  SiteViewScreen({super.key, required this.site});

  late final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          debugPrint('Loading progress: $progress%');
        },
        onPageStarted: (String url) {
          debugPrint('Page started loading: $url');
        },
        onPageFinished: (String url) {
          debugPrint('Page finished loading: $url');
        },
        onHttpError: (HttpResponseError error) {
          debugPrint('HTTP error: $error');
        },
        onWebResourceError: (WebResourceError error) {
          debugPrint('Web resource error: ${error.description}');
        },
        onNavigationRequest: (NavigationRequest request) {
          final Uri requestUri = Uri.parse(request.url);
          final Uri baseUri = Uri.parse(site.link);

          if (requestUri.host != baseUri.host &&
              !requestUri.host.endsWith('.${baseUri.host}')) {
            debugPrint('Blocked navigation to: ${request.url}');
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(site.link));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: site.bgColor,
        foregroundColor: site.fgColor,
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
