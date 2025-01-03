import 'package:flutter/material.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/utils/theme_store.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SiteViewScreen extends StatefulWidget {
  final SiteModel site;

  const SiteViewScreen({super.key, required this.site});

  @override
  State<SiteViewScreen> createState() => _SiteViewScreenState();
}

class _SiteViewScreenState extends State<SiteViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _isDarkTheme = ThemeStore.isDarkTheme();
  String progressNote = "";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress != 100 && mounted) {
              setState(() {
                progressNote = "Loading page $progress%";
              });
            }
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) async {
            debugPrint('Page finished loading: $url');
            await removeAds();
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('HTTP error: $error');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Web resource error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            final Uri requestUri = Uri.parse(request.url);
            final Uri baseUri = Uri.parse(widget.site.link);

            if (requestUri.host != baseUri.host &&
                !requestUri.host.endsWith('.${baseUri.host}')) {
              debugPrint('Blocked navigation to: ${request.url}');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.site.link));
  }

  Future removeAds() async {
    if (!mounted) return;

    setState(() {
      progressNote = "Blocking Ads..";
    });
    await _controller.runJavaScript('''
      document.querySelectorAll('script[src*="adsense"]').forEach(el => el.remove());
      document.querySelectorAll('iframe').forEach(el => {
        if (el.src.includes('ads') || el.src.includes('doubleclick')) {
          el.remove();
        }
      });
      document.querySelectorAll('[id*="ads"], [class*="ads"]').forEach(el => el.remove());
    ''');
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      progressNote = "";
      _isLoading = false;
    });
  }

  Future applyTheme() async {
    final themeScript = _isDarkTheme
        ? '''
      // Remove existing style element if present
      const existingStyle = document.getElementById('theme-style-ay');
      if (existingStyle) {
        existingStyle.remove();
      }

      // Add dark theme styles
      const styleElement = document.createElement('style');
      styleElement.id = 'theme-style';
      styleElement.innerHTML = `
        * {
          background-color: #121212 !important;
          color: #ffffff !important;
          border-color: #444444 !important;
        }
      `;
      document.head.appendChild(styleElement);
    '''
        : '''
      // Remove existing style element if present
      const existingStyle = document.getElementById('theme-style-ay');
      if (existingStyle) {
        existingStyle.remove();
      }

      // Add light theme styles
      const styleElement = document.createElement('style');
      styleElement.id = 'theme-style-ay';
      styleElement.innerHTML = `
        * {
          background-color: #ffffff !important;
          color: #000000 !important;
          border-color: #cccccc !important;
        }
      `;
      document.head.appendChild(styleElement);
    ''';

    await _controller.runJavaScript(themeScript);
  }

  Future adjustFontSize(double factor) async {
    await _controller.runJavaScript('''
    // Adjust font size based on the factor (increase or decrease)
    document.querySelectorAll('body, body *').forEach(el => {
      const currentFontSize = window.getComputedStyle(el).fontSize;
      const numericFontSize = parseFloat(currentFontSize);
      const newFontSize = numericFontSize * $factor; // Adjust font size by the factor
      el.style.fontSize = newFontSize + 'px'; // Apply the new font size
    });
  ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.site.bgColor,
        foregroundColor: widget.site.fgColor,
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'increase') {
                adjustFontSize(1.1);
              } else if (value == 'decrease') {
                adjustFontSize(0.9);
              } else if (value == 'theme') {
                setState(() {
                  _isDarkTheme = !_isDarkTheme;
                });
                applyTheme();
              } else if (value == 'reload') {
                _controller.reload();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'theme',
                  child: Row(
                    children: [
                      Icon(_isDarkTheme ? Icons.dark_mode : Icons.light_mode),
                      const SizedBox(width: 8),
                      Text(_isDarkTheme ? "Light mode" : "Dark mode"),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'increase',
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text('Increase Font Size'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'decrease',
                  child: Row(
                    children: [
                      Icon(Icons.remove),
                      SizedBox(width: 8),
                      Text('Decrease Font Size'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'reload',
                  child: Row(
                    children: [
                      Icon(Icons.replay),
                      SizedBox(width: 8),
                      Text('Reload webpage'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
