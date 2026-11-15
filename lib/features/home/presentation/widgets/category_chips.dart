import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/property.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.onMap,
  });

  final PropertyCategory selected;
  final ValueChanged<PropertyCategory> onChanged;
  final VoidCallback onMap;

  static const _labels = {
    PropertyCategory.apartment: 'شقق',
    PropertyCategory.villa: 'فيلات',
    PropertyCategory.duplex: 'دوبلكس',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      child: Row(
        children: [
          for (final c in PropertyCategory.values) ...[
            _Chip(
              label: _labels[c]!,
              selected: c == selected,
              onTap: () => onChanged(c),
            ),
            SizedBox(width: 8.w),
          ],
          const Spacer(),
          OutlinedButton.icon(
            onPressed: onMap,
            icon: Icon(Icons.map_outlined, size: 18.sp),
            label: Text('الخريطة',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            style: OutlinedButton.styleFrom(
              minimumSize: Size(0, 44.h),
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              shape: const StadiumBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(
      {required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary : Colors.white,
      shape: StadiumBorder(
        side: BorderSide(
            color: selected ? AppColors.primary : const Color(0xFFCBD5DC)),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Container(
          height: 44.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.center,
          child: Text(label,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : AppColors.ink)),
        ),
      ),
    );
  }
}
