part of 'authorization_bloc.dart';

sealed class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

final class AuthorizationInitial extends AuthorizationState {}

final class AuthorizationLoading extends AuthorizationState {}

final class AuthorizationSuccess extends AuthorizationState {}

final class AuthorizationFailure extends AuthorizationState {
  final String error;

  const AuthorizationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
