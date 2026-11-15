import 'package:dio/dio.dart';

abstract class Faileurs {
  const Faileurs(this.errMessage);
  final String errMessage;
}

typedef Failure = Faileurs;

class ServerFaileur extends Faileurs {
  const ServerFaileur({String err = 'Server error'}) : super(err);

  factory ServerFaileur.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFaileur(err: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return const ServerFaileur(err: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFaileur(err: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return const ServerFaileur(err: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFaileur.fromResponse(
          dioError.response?.statusCode ?? 500,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFaileur(err: 'Request to ApiServer was cancelled');
      case DioExceptionType.connectionError:
        return const ServerFaileur(err: 'No Internet Connection');
      case DioExceptionType.unknown:
        return const ServerFaileur(err: 'Unexpected error, please try again');
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  factory ServerFaileur.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map<String, dynamic> && response['message'] != null) {
        return ServerFaileur(err: response['message'].toString());
      }
      return const ServerFaileur(err: 'Authentication or authorization error');
    } else if (statusCode == 404) {
      return const ServerFaileur(
        err: 'Your request not found, please try later!',
      );
    } else if (statusCode == 500) {
      return const ServerFaileur(err: 'Internal Server error, please try later');
    } else {
      return const ServerFaileur(
        err: 'Oops, there was an error. Please try again',
      );
    }
  }
}

typedef ServerFailure = ServerFaileur;
