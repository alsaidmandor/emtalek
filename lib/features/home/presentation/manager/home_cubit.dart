import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/property_model.dart';
import '../../data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeState());

  final HomeRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(status: HomeStatus.loading));
    final result = await _repository.getHomeData();
    result.fold(
      (failure) => emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: failure.errMessage,
      )),
      (data) => emit(state.copyWith(
        status: HomeStatus.success,
        data: data,
      )),
    );
  }

  void setListing(ListingFilter value) => emit(state.copyWith(listing: value));

  void setCategory(PropertyCategory value) =>
      emit(state.copyWith(category: value));

  void clearFilters() => emit(state.copyWith(
        listing: ListingFilter.all,
        category: PropertyCategory.apartment,
      ));

  void toggleFavorite(String id) {
    final next = {...state.favoriteIds};
    if (!next.remove(id)) next.add(id);
    emit(state.copyWith(favoriteIds: next));
  }
}
