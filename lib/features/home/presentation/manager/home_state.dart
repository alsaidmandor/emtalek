import 'package:equatable/equatable.dart';

import '../../data/models/home_data_model.dart';
import '../../data/models/property_model.dart';

enum HomeStatus { loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.data = HomeDataModel.empty,
    this.listing = ListingFilter.all,
    this.category = PropertyCategory.apartment,
    this.city = 'القاهرة',
    this.favoriteIds = const {},
    this.errorMessage,
  });

  final HomeStatus status;
  final HomeDataModel data;
  final ListingFilter listing;
  final PropertyCategory category;
  final String city;
  final Set<String> favoriteIds;
  final String? errorMessage;

  List<PropertyModel> get featured => data.properties
      .where((p) => p.isFeatured && p.matches(listing))
      .toList();

  List<PropertyModel> get latest => data.properties
      .where((p) => p.category == category && p.matches(listing))
      .toList();

  HomeState copyWith({
    HomeStatus? status,
    HomeDataModel? data,
    ListingFilter? listing,
    PropertyCategory? category,
    String? city,
    Set<String>? favoriteIds,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
      listing: listing ?? this.listing,
      category: category ?? this.category,
      city: city ?? this.city,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, data, listing, category, city, favoriteIds, errorMessage];
}
