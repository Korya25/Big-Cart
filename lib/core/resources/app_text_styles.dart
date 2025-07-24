import 'package:big_cart/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle poppins30BlackBold = GoogleFonts.poppins(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static TextStyle poppins15Grey500 = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textGrey,
  );

  static TextStyle poppins15White800 = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textWhite,
  );
}
