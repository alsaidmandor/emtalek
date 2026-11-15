import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.divider)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundColor: AppColors.primary,
              child: Text('ع',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('عبدالله محمد',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w700)),
                  Text('القاهرة · عرض الملف الشخصي',
                      style: TextStyle(
                          fontSize: 13.sp, color: AppColors.secondary)),
                ],
              ),
            ),
            const Icon(Icons.chevron_left),
          ],
        ),
      ),
    );
  }
}

class DrawerGroup extends StatelessWidget {
  const DrawerGroup(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 4.h),
        child: Text(title,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.secondary)),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(this.icon, this.label,
      {super.key, this.badge = 0, this.trailing, this.danger = false});

  final IconData icon;
  final String label;
  final int badge;
  final String? trailing;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final color = danger ? AppColors.logout : AppColors.ink;
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 52.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Icon(icon, size: 22.sp, color: danger ? color : AppColors.primary),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(label,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: color)),
              ),
              if (trailing != null)
                Text(trailing!,
                    style: TextStyle(fontSize: 15.sp, color: AppColors.primary)),
              if (badge > 0)
                CircleAvatar(
                  radius: 11.r,
                  backgroundColor: AppColors.danger,
                  child: Text('$badge',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
