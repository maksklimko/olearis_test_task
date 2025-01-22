import 'package:equatable/equatable.dart';

class UserCredentials extends Equatable {
  final String login;
  final String password;

  const UserCredentials({required this.login, required this.password});

  @override
  List<Object?> get props => [login, password];
}
