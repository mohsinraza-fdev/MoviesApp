import 'dart:io';

import 'package:flutter/foundation.dart';

class AppPlatform {
  static bool get isWeb {
    if (kIsWeb) {
      return true;
    }
    return false;
  }

  static bool get isAndroid {
    if (kIsWeb) {
      return false;
    }
    if (Platform.isAndroid) {
      return true;
    }
    return false;
  }

  static bool get isIOS {
    if (kIsWeb) {
      return false;
    }
    if (Platform.isIOS) {
      return true;
    }
    return false;
  }
}
