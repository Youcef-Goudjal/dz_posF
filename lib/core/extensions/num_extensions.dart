import 'dart:async';

import 'package:flutter/material.dart';

extension NumExt on num {
  ///   print('+ wait for 2 seconds');
  ///   await 2.delay();
  ///   print('- 2 seconds completed');
  ///   print('+ callback in 1.2sec');
  ///   1.delay(() => print('- 1.2sec callback called'));
  ///   print('currently running callback 1.2sec');
  Future<dynamic> delay([FutureOr<dynamic> Function()? callback]) async =>
      Future.delayed(
        Duration(milliseconds: (this * 1000).round()),
        callback,
      );

  /// print(1.seconds + 200.milliseconds);
  /// print(1.hours + 30.minutes);
  /// print(1.5.hours);
  ///```
  Duration get milliseconds => Duration(microseconds: (this * 1000).round());
  Duration get seconds => Duration(seconds: round());
  Duration get minutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());
  Duration get hours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());
  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());
  // operations helpers
  bool isLowerThan(num b) => this < b;
  bool isGreaterThan(num b) => this > b;
  bool isEqual(num b) => this == b;
  // SizedBox
  Widget get widthBox => SizedBox(
        width: double.tryParse(toString()),
      );
  Widget get heightBox => SizedBox(
        height: double.tryParse(toString()),
      );
}

extension DoubleExt on double {
  Radius get radius => Radius.circular(this);
}

extension IntExt on int {
  Radius get radius => Radius.circular(toDouble());
}
