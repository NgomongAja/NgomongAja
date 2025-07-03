import 'package:flutter/foundation.dart';

class LoggerUtil {
  static void log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
