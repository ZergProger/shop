import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop/authorization/abstract_authorization.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final AbstractAuthorization repos;

  AuthorizationBloc(this.repos) : super(AuthorizationInitial()) {
    on<AuthorizationLogin>(_login);
    on<AuthorizationRegister>(_register);
    on<AuthorizationGoogle>(_google);
  }

  Future<void> _login(
      AuthorizationLogin event, Emitter<AuthorizationState> emit) async {
    try {
      emit(AuthorizationLoading());
      await repos.signIn(event.email, event.password);
      emit(AuthorizationSuccess());
    } catch (e) {
      emit(AuthorizationFailure(error: e.toString()));
    }
  }

  Future<void> _register(
      AuthorizationRegister event, Emitter<AuthorizationState> emit) async {
    try {
      emit(AuthorizationLoading());
      await repos.register(event.email, event.password);
      emit(AuthorizationSuccess());
    } catch (e) {
      emit(AuthorizationFailure(error: e.toString()));
    }
  }

  Future<void> _google(
      AuthorizationGoogle event, Emitter<AuthorizationState> emit) async {
    try {
      emit(AuthorizationLoading());
      await repos.singGoogle();
      emit(AuthorizationSuccess());
    } catch (e) {
      emit(AuthorizationFailure(error: e.toString()));
    }
  }
}
