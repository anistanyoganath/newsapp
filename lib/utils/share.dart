import 'dart:io';
import 'package:share_plus/share_plus.dart';

final String appUrl = Platform.isAndroid ? "" : "";

void shareApp() {
  Share.share(
    "Explore all news sites in Sri Lanka in one place: $appUrl",
    subject: "Download now and stay updated with all news in Sri Lanka",
  );
}
