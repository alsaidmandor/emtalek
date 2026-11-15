import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/format.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_tag.dart';
import '../../domain/entities/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final p = project;
    return Container(
      width: 288.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.project, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AppNetworkImage(
                imageUrl: p.imageUrl,
                height: 160.h,
                width: double.infinity,
                fallbackLabel: 'صورة المشروع',
              ),
              PositionedDirectional(
                top: 12.h,
                start: 12.w,
                child: const AppTag('مشروع', color: AppColors.project),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.name,
                    style: TextStyle(
                        fontSize: 17.sp, fontWeight: FontWeight.w700)),
                SizedBox(height: 6.h),
                Text('تبدأ من ${formatPrice(p.startingPrice)} ج.م',
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary)),
                SizedBox(height: 6.h),
                Text(p.location,
                    style: TextStyle(
                        fontSize: 13.sp, color: AppColors.secondary)),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(p.unitTypes,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w600)),
                    SizedBox(width: 14.w),
                    Text('التسليم ${p.delivery}',
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                Divider(height: 20.h, color: AppColors.divider),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('بواسطة ${p.developer}',
                        style: TextStyle(
                            fontSize: 12.sp, color: AppColors.secondary)),
                    Text(p.postedAgo,
                        style: TextStyle(
                            fontSize: 12.sp, color: AppColors.secondary)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
