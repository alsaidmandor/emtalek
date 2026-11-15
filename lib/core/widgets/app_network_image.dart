import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'image_placeholder.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.fallbackLabel = 'صورة',
    this.borderRadius,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String fallbackLabel;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (imageUrl.trim().isEmpty) {
      imageWidget = ImagePlaceholder(
        label: fallbackLabel,
        height: height,
        width: width,
      );
    } else {
      imageWidget = Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, __, ___) => ImagePlaceholder(
          label: fallbackLabel,
          height: height,
          width: width,
        ),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            height: height,
            width: width,
            color: AppColors.placeholder,
          );
        },
      );
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }
    return imageWidget;
  }
}
