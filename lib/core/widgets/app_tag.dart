import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppTag extends StatelessWidget {
  const AppTag(this.text,
      {super.key, this.color = AppColors.primary, this.textColor = Colors.white});

  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w700, color: textColor),
      ),
    );
  }
}
