import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class AddPropertyCta extends StatelessWidget {
  const AddPropertyCta({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.primaryTint,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('عندك عقار للبيع أو الإيجار؟',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700)),
                  SizedBox(height: 2.h),
                  Text('أضفه وابدأ استقبال الطلبات',
                      style: TextStyle(
                          fontSize: 13.sp, color: const Color(0xFF33424D))),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            FilledButton(
              onPressed: onTap,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.ink,
                minimumSize: Size(0, 44.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
              ),
              child: Text('+ أضف عقارك',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}
