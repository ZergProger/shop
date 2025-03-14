part of 'authorization_bloc.dart';

sealed class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();

  @override
  List<Object> get props => [];
}

final class AuthorizationLogin extends AuthorizationEvent {
  final String email;
  final String password;

  const AuthorizationLogin({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

final class AuthorizationLogout extends AuthorizationEvent {}

final class AuthorizationRegister extends AuthorizationEvent {
  final String email;
  final String password;
  final String username;

  const AuthorizationRegister({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object> get props => [email, password, username];
}

final class AuthorizationGoogle extends AuthorizationEvent {}
