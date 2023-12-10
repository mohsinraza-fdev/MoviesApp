import 'dart:developer';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ten_twenty_test/network/exceptions.dart';

double screenWidth(BuildContext context, {double multiplier = 1}) =>
    MediaQuery.of(context).size.width * multiplier;
double screenHeight(BuildContext context, {double multiplier = 1}) =>
    MediaQuery.of(context).size.height * multiplier;
double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;
double screenBottomPadding(BuildContext context) =>
    MediaQuery.of(context).padding.bottom;
bool isKeyboardOpen(BuildContext context) =>
    MediaQuery.of(context).viewInsets.bottom > 10;

String durationToMMSS(Duration duration) {
  return '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';
}

T parseModel<T>(T Function() model) {
  try {
    return model();
  } catch (e) {
    log('${T.toString()} - Could not map response to model');
    throw (const ClientException(
      message: 'something_went_wrong',
      statusCode: -1,
    ));
  }
}

logJson(dynamic json) {
  if (!kDebugMode) return;
  if (json is FormData) {
    log(json.fields.toString());
    return;
  }
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final String prettyString = encoder.convert(json);
  if (kIsWeb) {
    print(prettyString);
    return;
  }
  log(prettyString);
}
