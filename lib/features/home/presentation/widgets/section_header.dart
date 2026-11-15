import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Title + "عرض الكل" followed by optional [imageUrl] banner and [child], with bottom spacing.
class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.title,
    required this.child,
    this.imageUrl,
    this.onViewAll,
  });

  final String title;
  final Widget child;
  final String? imageUrl;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700)),
                ),
                TextButton(
                  onPressed: onViewAll ?? () {},
                  style: TextButton.styleFrom(minimumSize: Size(44.w, 44.h)),
                  child: Text('عرض الكل',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary)),
                ),
              ],
            ),
          ),
          /*if (imageUrl != null && imageUrl!.trim().isNotEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 14.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: AppNetworkImage(
                  imageUrl: imageUrl!,
                  height: 110.h,
                  width: double.infinity,
                  fallbackLabel: title,
                ),
              ),
            ),*/
          child,
        ],
      ),
    );
  }
}
