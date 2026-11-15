import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'home_header.dart';
import 'listing_filter_bar.dart';
import 'search_filter_bar.dart';

/// White pinned block: header, search + filter, city + sale/rent switch.
class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key, required this.state, required this.onMenu});

  final HomeState state;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final top = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(8.w, top + 8.h, 8.w, 12.h),
      child: Column(
        children: [
          HomeHeader(
            onMenu: onMenu,
            notifications: state.data.unreadNotifications,
            messages: state.data.unreadMessages,
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                SearchFilterBar(onFilter: () {}),
                SizedBox(height: 8.h),
                ListingFilterBar(
                  city: state.city,
                  selected: state.listing,
                  onChanged: cubit.setListing,
                  onCityTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
