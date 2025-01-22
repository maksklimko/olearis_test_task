import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test_task/config/injector/injector.dart';
import 'package:olearis_test_task/core/models/user_credentials.dart';
import 'package:olearis_test_task/core/services/authentication_service.dart';
import 'package:olearis_test_task/features/login/cubit/login_view/login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit() : super(const LoginViewState());

  Future<bool> onContinueButtonTap() async {
    emit(state.copyWith(isLoading: true));
    final credentials = UserCredentials(
      login: state.email,
      password: state.password,
    );
    final authResponse = await getIt
        .get<AuthenticationService>()
        .login(credentials: credentials);
    emit(state.copyWith(isLoading: false));
    return authResponse.isRight();
  }

  void updateEmail(String? email) {
    emit(
      state.copyWith(
        email: email,
        isValid: validateFields(email: email),
      ),
    );
  }

  void updatePassword(String? password) {
    emit(
      state.copyWith(
        password: password,
        isValid: validateFields(password: password),
      ),
    );
  }

  // bool validateFields({String? email, String? password}) {
  //   return (email ?? state.email).isNotEmpty &&
  //       (password ?? state.password).isNotEmpty;
  // }
  bool validateFields({String? email, String? password}) {
    return true;
  }
}
