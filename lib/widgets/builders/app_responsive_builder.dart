import 'package:flutter/material.dart';
import 'package:ten_twenty_test/shared/enums/app_device_orientation_enum.dart';
import 'package:ten_twenty_test/shared/enums/app_device_size_enum.dart';
import 'package:ten_twenty_test/shared/helpers/app_device.dart';

class AppResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    AppDeviceType deviceType,
    AppDeviceOrientation deviceOrientation,
  ) builder;
  const AppResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    AppDevice device = AppDevice.of(context);
    return builder(context, device.type, device.orientation);
  }
}
