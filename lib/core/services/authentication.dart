import 'package:fpdart/fpdart.dart';
import 'package:olearis_test_task/core/models/errors/app_error.dart';
import 'package:olearis_test_task/core/models/user_credentials.dart';

abstract class Authentication {
  UserCredentials? currentUser;

  Future<Either<AppError, UserCredentials>> signup({
    required UserCredentials credentials,
  });

  Future<Either<AppError, UserCredentials>> login({
    required UserCredentials credentials,
  });

  Future<Either<AppError, bool>> logout();

  bool isAuthenticated();
}
