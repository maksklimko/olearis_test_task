import 'package:olearis_test_task/config/resources/app_error_messages.dart';
import 'package:olearis_test_task/core/models/errors/app_error.dart';

class AuthenticationError extends AppError {
  AuthenticationError(super.message);
}

class InvalidCredentialsError extends AuthenticationError {
  InvalidCredentialsError([
    super.message = AppErrorMessages.invalidCredentials,
  ]);
}

class UnknownError extends AppError {
  UnknownError([super.message = AppErrorMessages.unknownError]);
}
