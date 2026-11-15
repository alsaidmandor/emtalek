import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

/// Tabs from the right (RTL): developers, market, HOME, offers, my properties.
/// Indexes: 0 developers, 1 market, 2 home, 3 offers, 4 my properties.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.index, required this.onChanged});

  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final inset = MediaQuery.of(context).padding.bottom;
    final barHeight = 84.h + inset;
    return SizedBox(
      height: 24.h + barHeight,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: barHeight,
            child: Container(
              padding: EdgeInsets.only(bottom: inset),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                children: [
                  _tab(0, Icons.groups_outlined, 'المطورون'),
                  _tab(1, Icons.storefront_outlined, 'السوق'),
                  SizedBox(width: 76.w),
                  _tab(3, Icons.local_fire_department_outlined, 'العروض'),
                  _tab(4, Icons.apartment_outlined, 'عقاراتي'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(child: _HomeButton(
              selected: index == 2,
              onTap: () => onChanged(2),
            )),
          ),
        ],
      ),
    );
  }

  Widget _tab(int i, IconData icon, String label) {
    final selected = index == i;
    final color = selected ? AppColors.primary : AppColors.secondary;
    return Expanded(
      child: InkWell(
        onTap: () => onChanged(i),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: selected ? AppColors.primary : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24.sp, color: color),
              SizedBox(height: 2.h),
              Text(label,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: color)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton({required this.selected, required this.onTap});

  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'الرئيسية',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? AppColors.primary : Colors.white,
            border: Border.all(
              color: selected ? Colors.white : AppColors.primary,
              width: selected ? 4 : 2,
            ),
            boxShadow: const [
              BoxShadow(color: Color(0x40000000), blurRadius: 6, offset: Offset(0, 2)),
            ],
          ),
          child: Icon(Icons.home_outlined,
              size: 28.sp, color: selected ? Colors.white : AppColors.primary),
        ),
      ),
    );
  }
}
