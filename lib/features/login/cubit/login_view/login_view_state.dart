import 'package:equatable/equatable.dart';

class LoginViewState extends Equatable {
  final bool isLoading;
  final bool isValid;
  final String email;
  final String password;

  const LoginViewState({
    this.isLoading = false,
    this.isValid = false,
    this.email = '',
    this.password = '',
  });

  LoginViewState copyWith({
    bool? isLoading,
    bool? isValid,
    String? email,
    String? password,
  }) {
    return LoginViewState(
      isLoading: isLoading ?? this.isLoading,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isValid,
        email,
        password,
      ];
}
