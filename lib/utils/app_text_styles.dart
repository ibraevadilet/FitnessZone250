import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const fonst = 'Inter';

abstract class AppTextStylesFitnessZone {
  static TextStyle s10Wbold({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
  static TextStyle s16W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );
  static TextStyle s16W500({Color? color}) => TextStyle(
        fontFamily: fonst,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );
  static TextStyle s17W600({Color? color}) => TextStyle(
        fontFamily: fonst,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );
  static TextStyle s19W900({Color? color}) => TextStyle(
        fontFamily: fonst,
        fontSize: 19.sp,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle s12W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s12W500({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      );
  static TextStyle s14W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s15W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s15W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s28W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s46W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 46.sp,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s57W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 57.sp,
        fontWeight: FontWeight.w700,
      );
}