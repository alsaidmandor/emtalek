import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.onMenu,
    this.notifications = 0,
    this.messages = 0,
  });

  final VoidCallback onMenu;
  final int notifications;
  final int messages;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _HeaderButton(icon: Icons.menu, label: 'القائمة', onTap: onMenu),
        Image.asset('assets/images/logo.png', height: 36.h),
        const Spacer(),
        _HeaderButton(
            icon: Icons.notifications_none,
            label: 'الإشعارات',
            badge: notifications,
            onTap: () {}),
        _HeaderButton(
            icon: Icons.chat_bubble_outline,
            label: 'الدردشة',
            badge: messages,
            onTap: () {}),
      ],
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.badge = 0,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final int badge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44.w,
      height: 44.h,
      child: Stack(
        children: [
          IconButton(
            tooltip: label,
            onPressed: onTap,
            icon: Icon(icon, size: 26.sp, color: AppColors.ink),
          ),
          if (badge > 0)
            PositionedDirectional(
              top: 4.h,
              end: 2.w,
              child: Container(
                constraints: BoxConstraints(minWidth: 18.w, minHeight: 18.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.danger,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: Text('$badge',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700)),
              ),
            ),
        ],
      ),
    );
  }
}
