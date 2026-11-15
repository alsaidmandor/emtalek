import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

/// Replace with Image.network(...) once real photos are available.
class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key, required this.label, this.height, this.width});

  final String label;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: AppColors.placeholder,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 13.sp, color: AppColors.placeholderText),
      ),
    );
  }
}
