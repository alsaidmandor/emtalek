import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/api_settings.dart';
import '../models/home_data_model.dart';
import 'home_repository.dart';

class HomeRepoImpl implements HomeRepository {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<Either<Faileurs, HomeDataModel>> getHomeData() async {
    try {
      final response = await _apiService.get(
        endPoint: ApiSettings.homeData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(
          HomeDataModel.fromJson(response.data as Map<String, dynamic>?),
        );
      }

      return Left(
        ServerFaileur.fromResponse(
          response.statusCode ?? 500,
          response.data,
        ),
      );
    } on DioException catch (e) {
      return Left(
        ServerFaileur.fromDioError(e),
      );
    } catch (e) {
      return Left(
        ServerFaileur(
          err: e.toString(),
        ),
      );
    }
  }
}
