import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/home_data_model.dart';

abstract class HomeRepository {
  Future<Either<Faileurs, HomeDataModel>> getHomeData();
}
