import 'dart:io';
import 'package:share_plus/share_plus.dart';

final String appUrl = Platform.isAndroid
    ? "https://play.google.com/store/apps/details?id=com.adavii.ccoffers"
    : "";

void shareOffer(String offerTitle, String offerLink) {
  Share.share(
    "$offerTitle.\nCheck it out here: $offerLink\nTry the app for more great deals: $appUrl",
    subject: "Check out this amazing offer!",
  );
}
