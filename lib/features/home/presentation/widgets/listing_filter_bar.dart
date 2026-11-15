import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/property.dart';

class ListingFilterBar extends StatelessWidget {
  const ListingFilterBar({
    super.key,
    required this.city,
    required this.selected,
    required this.onChanged,
    required this.onCityTap,
  });

  final String city;
  final ListingFilter selected;
  final ValueChanged<ListingFilter> onChanged;
  final VoidCallback onCityTap;

  static const _labels = {
    ListingFilter.all: 'الكل',
    ListingFilter.sale: 'للبيع',
    ListingFilter.rent: 'للإيجار',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: onCityTap,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(0, 44.h),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            side: const BorderSide(color: AppColors.border),
            shape: const StadiumBorder(),
            backgroundColor: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(city,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink)),
              Icon(Icons.keyboard_arrow_down,
                  size: 18.sp, color: AppColors.ink),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.field,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Row(
              children: [
                for (final f in ListingFilter.values)
                  Expanded(
                    child: _Segment(
                      label: _labels[f]!,
                      selected: f == selected,
                      onTap: () => onChanged(f),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment(
      {required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(20.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: SizedBox(
          height: 40.h,
          child: Center(
            child: Text(label,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : AppColors.ink)),
          ),
        ),
      ),
    );
  }
}
