import 'dart:io';

import 'package:flutter/foundation.dart';

class AdIds {
  static String bannerAdId = kDebugMode
      ? "ca-app-pub-3940256099942544/6300978111"
      : Platform.isAndroid
          ? "ca-app-pub-8711818051017729/5664080200"
          : "ca-app-pub-8711818051017729/3526410568";
  static String interestialAdId = kDebugMode
      ? "ca-app-pub-3940256099942544/1033173712"
      : Platform.isAndroid
          ? "ca-app-pub-8711818051017729/3023101852"
          : "ca-app-pub-8711818051017729/1008860764";
}
