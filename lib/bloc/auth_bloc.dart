import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;

        if (!isValidEmail(email)) {
          return emit(AuthFailure('Invalid email address'));
        }
        if (password.length < 6) {
          return emit(
              AuthFailure('Password must be at least 6 characters long'));
        }
        emit(AuthSuccess(uid: '$email- $password'));
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
    on<AuthLogoutRequested>((event, emit) async {
      emit(AuthInitial());
      try {
        await Future.delayed(const Duration(seconds: 1));
        emit(AuthInitial());
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
