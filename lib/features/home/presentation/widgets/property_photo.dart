import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/app_tag.dart';
import '../../domain/entities/property.dart';

class PropertyPhoto extends StatelessWidget {
  const PropertyPhoto({
    super.key,
    required this.p,
    required this.isFavorite,
    required this.onFavorite,
  });

  final Property p;
  final bool isFavorite;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppNetworkImage(
          imageUrl: p.imageUrl,
          height: 160.h,
          width: double.infinity,
          fallbackLabel: 'صورة العقار',
        ),
        PositionedDirectional(
          top: 12.h,
          start: 12.w,
          child: Row(
            children: [
              if (p.isFeatured)
                const AppTag('مميز',
                    color: AppColors.accent, textColor: AppColors.ink),
              if (p.isFeatured) SizedBox(width: 6.w),
              AppTag(p.type == ListingType.sale ? 'للبيع' : 'للإيجار'),
            ],
          ),
        ),
        PositionedDirectional(
          top: 8.h,
          end: 8.w,
          child: Material(
            color: Colors.white,
            shape: const CircleBorder(),
            child: IconButton(
              tooltip: isFavorite ? 'إزالة من المفضلة' : 'أضف للمفضلة',
              constraints: BoxConstraints.tightFor(width: 44.w, height: 44.w),
              onPressed: onFavorite,
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 22.sp, color: AppColors.danger),
            ),
          ),
        ),
      ],
    );
  }
}
