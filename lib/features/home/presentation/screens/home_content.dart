import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/property.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/add_property_cta.dart';
import '../widgets/cards_row.dart';
import '../widgets/category_chips.dart';
import '../widgets/city_cards.dart';
import '../widgets/hero_banner.dart';
import '../widgets/home_top_section.dart';
import '../widgets/news_card.dart';
import '../widgets/project_card.dart';
import '../widgets/properties_carousel.dart';
import '../widgets/property_card.dart';
import '../widgets/section_header.dart';
import '../widgets/skeleton_card.dart';
import '../widgets/state_message.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.state, required this.onMenu});

  final HomeState state;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Column(
      children: [
        HomeTopSection(state: state, onMenu: onMenu),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 16.h),
              ),
              if (state.status == HomeStatus.failure)
                SliverToBoxAdapter(
                  child: StateMessage(
                    icon: Icons.wifi_off,
                    title: 'تعذر تحميل العقارات',
                    subtitle: 'تأكد من الاتصال بالإنترنت ثم حاول مرة أخرى',
                    actionLabel: 'إعادة المحاولة',
                    onAction: cubit.load,
                  ),
                )
              else
                ..._sections(context).map((w) => SliverToBoxAdapter(child: w)),
              SliverToBoxAdapter(
                child: SizedBox(height: 16.h),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _sections(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final loading = state.status == HomeStatus.loading;
    const skeletons = CardsRow(children: [SkeletonCard(), SkeletonCard()]);

    Widget cards(List<Property> items) => CardsRow(children: [
          for (final p in items)
            PropertyCard(
              property: p,
              isFavorite: state.favoriteIds.contains(p.id),
              onFavorite: () => _toggleFavorite(context, p),
            ),
        ]);

    return [
      const HeroBanner(),
      SizedBox(height: 24.h),
      if (loading || state.featured.isNotEmpty)
        HomeSection(
          title: 'عقارات مميزة',
          imageUrl:
              'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1000&auto=format&fit=crop&q=80',
          child: loading ? skeletons : cards(state.featured),
        ),
      AddPropertyCta(onTap: () {}),
      HomeSection(
        title: 'أحدث العقارات',
        imageUrl:
            'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=1000&auto=format&fit=crop&q=80',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryChips(
              selected: state.category,
              onChanged: cubit.setCategory,
              onMap: () {},
            ),
            if (loading)
              skeletons
            else if (state.latest.isEmpty)
              StateMessage(
                icon: Icons.search_off,
                title: 'لا توجد عقارات مطابقة',
                subtitle: 'جرّب تغيير الفلاتر أو توسيع المنطقة',
                actionLabel: 'مسح الفلاتر',
                onAction: cubit.clearFilters,
              )
            else
              PropertiesCarousel(
                properties: state.latest,
                favoriteIds: state.favoriteIds,
                onFavorite: (p) => _toggleFavorite(context, p),
              ),
          ],
        ),
      ),
      HomeSection(
        title: 'أهم المشاريع العقارية',
        imageUrl:
            'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=1000&auto=format&fit=crop&q=80',
        child: loading
            ? skeletons
            : CardsRow(children: [
                for (final p in state.data.projects) ProjectCard(project: p),
              ]),
      ),
      if (!loading) ...[
        HomeSection(
          title: 'ابحث عن عقارك بالمدينة',
          imageUrl:
              'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=1000&auto=format&fit=crop&q=80',
          child: CityCards(cities: state.data.cities),
        ),
        if (state.data.news.isNotEmpty)
          HomeSection(
            title: 'أهم الأخبار',
            child: NewsCard(item: state.data.news.first),
          ),
      ],
    ];
  }

  void _toggleFavorite(BuildContext context, Property p) {
    final cubit = context.read<HomeCubit>();
    final wasFavorite = cubit.state.favoriteIds.contains(p.id);
    cubit.toggleFavorite(p.id);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
            wasFavorite ? 'تمت الإزالة من المفضلة' : 'تمت الإضافة إلى المفضلة'),
        action: SnackBarAction(
          label: 'تراجع',
          onPressed: () => cubit.toggleFavorite(p.id),
        ),
      ));
  }
}
