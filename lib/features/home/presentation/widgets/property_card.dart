import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/format.dart';
import '../../domain/entities/property.dart';
import 'property_photo.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({
    super.key,
    required this.property,
    required this.isFavorite,
    required this.onFavorite,
    this.width,
  });

  final Property property;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final p = property;
    return Container(
      width: width ?? 288.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: p.isFeatured ? AppColors.accent : AppColors.border,
          width: p.isFeatured ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PropertyPhoto(p: p, isFavorite: isFavorite, onFavorite: onFavorite),
          Padding(
            padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${formatPrice(p.price)} ج.م',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary)),
                SizedBox(height: 6.h),
                SizedBox(
                  height: 45.h,
                  child: Text(p.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.sp,
                          height: 1.5,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 6.h),
                Text(p.location,
                    style: TextStyle(
                        fontSize: 13.sp, color: AppColors.secondary)),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    _Spec('${p.bedrooms} غرف'),
                    SizedBox(width: 14.w),
                    _Spec('${p.bathrooms} حمامات'),
                    SizedBox(width: 14.w),
                    _Spec('${formatPrice(p.area)} م²'),
                  ],
                ),
                Divider(height: 20.h, color: AppColors.divider),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('بواسطة ${p.agent}',
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

class _Spec extends StatelessWidget {
  const _Spec(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(text,
      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600));
}
