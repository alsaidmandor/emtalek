import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/property.dart';
import 'property_card.dart';

class PropertiesCarousel extends StatefulWidget {
  const PropertiesCarousel({
    super.key,
    required this.properties,
    required this.favoriteIds,
    required this.onFavorite,
  });

  final List<Property> properties;
  final Set<String> favoriteIds;
  final void Function(Property) onFavorite;

  @override
  State<PropertiesCarousel> createState() => _PropertiesCarouselState();
}

class _PropertiesCarouselState extends State<PropertiesCarousel> {
  late final PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void didUpdateWidget(covariant PropertiesCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.properties.length != oldWidget.properties.length) {
      if (_currentIndex >= widget.properties.length) {
        _currentIndex = 0;
        if (_controller.hasClients) {
          _controller.jumpToPage(0);
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.properties.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 385.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.properties.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final property = widget.properties[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: PropertyCard(
                  property: property,
                  isFavorite: widget.favoriteIds.contains(property.id),
                  onFavorite: () => widget.onFavorite(property),
                  width: double.infinity,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        if (widget.properties.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < widget.properties.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: i == _currentIndex ? 22.w : 7.w,
                  height: 7.w,
                  decoration: BoxDecoration(
                    color: i == _currentIndex
                        ? AppColors.primary
                        : AppColors.border,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
