import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Used for the empty-results and error states.
class StateMessage extends StatelessWidget {
  const StateMessage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onAction,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: AppColors.primaryTint,
            child: Icon(icon, size: 30.sp, color: AppColors.primary),
          ),
          SizedBox(height: 12.h),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700)),
          SizedBox(height: 4.h),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFF44525D))),
          SizedBox(height: 16.h),
          FilledButton(
            onPressed: onAction,
            style: FilledButton.styleFrom(
              minimumSize: Size(0, 48.h),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
            ),
            child: Text(actionLabel,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
