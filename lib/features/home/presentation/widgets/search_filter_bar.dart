import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({super.key, required this.onFilter});

  final VoidCallback onFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.field,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 22.sp, color: AppColors.secondary),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 15.sp),
                    decoration: InputDecoration.collapsed(
                      hintText: 'ابحث بالمنطقة أو المشروع',
                      hintStyle: TextStyle(
                          fontSize: 15.sp, color: AppColors.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Tooltip(
          message: 'فلترة',
          child: Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.r),
              onTap: onFilter,
              child: SizedBox(
                width: 48.w,
                height: 48.w,
                child: Icon(Icons.tune, color: Colors.white, size: 22.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
