part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final email;
  final password;

  AuthLoginRequested({this.email, this.password});
}

final class AuthLogoutRequested extends AuthEvent {
  AuthLogoutRequested();
}
