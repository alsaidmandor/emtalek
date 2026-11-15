import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import 'drawer_parts.dart';

class MoreDrawer extends StatelessWidget {
  const MoreDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320.w,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DrawerProfile(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: AppColors.ink,
                          minimumSize: Size(double.infinity, 52.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                        ),
                        child: Text('+ أضف عقارك',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const DrawerGroup('حسابي'),
                    const DrawerItem(Icons.favorite_border, 'عقاراتي المفضلة'),
                    const DrawerItem(Icons.notifications_none, 'الإشعارات', badge: 2),
                    const DrawerItem(Icons.chat_bubble_outline, 'الدردشة', badge: 6),
                    const Divider(color: AppColors.divider, indent: 20, endIndent: 20),
                    const DrawerGroup('خدماتي'),
                    const DrawerItem(Icons.workspace_premium_outlined, 'شراء باقات'),
                    const DrawerItem(Icons.domain_outlined, 'أحدث المشاريع'),
                    const DrawerItem(Icons.groups_outlined, 'المطورون'),
                    const Divider(color: AppColors.divider, indent: 20, endIndent: 20),
                    const DrawerGroup('الدعم'),
                    const DrawerItem(Icons.help_outline, 'مركز المساعدة'),
                    const DrawerItem(Icons.headset_mic_outlined, 'خدمة العملاء'),
                  ],
                ),
              ),
            ),
            const Divider(color: AppColors.divider, indent: 20, endIndent: 20),
            const DrawerItem(Icons.language, 'اللغة', trailing: 'العربية'),
            const DrawerItem(Icons.logout, 'تسجيل الخروج', danger: true),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

