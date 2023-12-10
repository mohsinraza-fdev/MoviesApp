import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ten_twenty_test/shared/enums/app_device_orientation_enum.dart';
import 'package:ten_twenty_test/shared/enums/app_device_size_enum.dart';

class AppDevice {
  final AppDeviceType type;
  final AppDeviceOrientation orientation;

  AppDevice._({
    required this.type,
    required this.orientation,
  });

  static AppDevice of(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppDevice._(
      type: _deviceType(size),
      orientation: _deviceOrientation(size),
    );
  }

  static AppDeviceType _deviceType(Size size) {
    if (size.shortestSide < 550) {
      return AppDeviceType.mobile;
    }
    if (size.shortestSide < 1000) {
      return AppDeviceType.tablet;
    }
    return AppDeviceType.desktop;
  }

  static AppDeviceOrientation _deviceOrientation(Size size) {
    if (size.aspectRatio > 1) {
      return AppDeviceOrientation.landscape;
    }
    return AppDeviceOrientation.potrait;
  }
}
