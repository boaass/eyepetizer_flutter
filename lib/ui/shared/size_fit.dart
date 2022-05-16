import 'package:flutter/material.dart';
import 'dart:ui';

class ZCLSizeFit {
  static double? physicalWidth;
  static double? physicalHeight;
  static double? screenWidth;
  static double? screenHeight;
  static double? dpr;
  static double? statusHeight;

  static double? rpx;
  static double? px;

  static void initialize({double standardSize = 750}) {
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    // print("分辨率: $physicalWidth, $physicalHeight");

    dpr = window.devicePixelRatio;
    screenWidth = physicalWidth! / dpr!;
    screenHeight = physicalHeight! / dpr!;
    // print("分辨率: $screenWidth, $screenHeight");

    statusHeight = window.padding.top / dpr!;
    // print("状态栏高度: $statusHeight");

    rpx = screenWidth! / standardSize;
    px = screenWidth! / standardSize * 2;
  }

  static double setRpx(double size) {
    return size * rpx!;
  }

  static double setPx(double size) {
    return size * px!;
  }
}