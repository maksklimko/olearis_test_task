import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olearis_test_task/features/login/cubit/login_view/login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit() : super(const LoginViewState());

  Future onContinueButtonTap() async {
    emit(state.copyWith(isLoading: true));
    //Call authentication service
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
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

  bool validateFields({String? email, String? password}) {
    return (email ?? state.email).isNotEmpty &&
        (password ?? state.password).isNotEmpty;
  }
}
