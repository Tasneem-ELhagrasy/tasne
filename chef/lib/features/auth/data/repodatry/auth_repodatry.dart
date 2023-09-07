import 'package:chef/core/database/api/api_consumer.dart';
import 'package:chef/core/database/api/end_points.dart';
import 'package:chef/core/errors/exceptions.dart';
import 'package:chef/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/service/service_locator.dart';

class AuthRepodatry {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoints.signIn, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
      });
      return Right(LoginModel.fromJson(response));
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoints.sendCode,
        data: {
          ApiKeys.email: email,
        },
      );
      return Right(
        response[ApiKeys.message],
      );
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
