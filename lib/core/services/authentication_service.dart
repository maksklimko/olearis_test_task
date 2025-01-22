import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:olearis_test_task/core/models/errors/app_error.dart';
import 'package:olearis_test_task/core/models/errors/authentication_error.dart';
import 'package:olearis_test_task/core/models/user_credentials.dart';
import 'package:olearis_test_task/core/services/authentication.dart';

@singleton
class AuthenticationService extends Authentication {
  @override
  bool isAuthenticated() => currentUser != null;

  @override
  Future<Either<AppError, UserCredentials>> login({
    required UserCredentials credentials,
  }) async {
    try {
      if (credentials.login.isEmpty || credentials.password.isEmpty) {
        return left(InvalidCredentialsError());
      }
      // Calling Auth api
      await Future.delayed(const Duration(seconds: 1));
      // Updating current user data
      currentUser = credentials;

      return right(credentials);
    } catch (e) {
      return left(UnknownError());
    }
  }

  @override
  Future<Either<AppError, bool>> logout() async {
    currentUser = null;
    return right(true);
  }

  @override
  Future<Either<AppError, UserCredentials>> signup({
    required UserCredentials credentials,
  }) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
