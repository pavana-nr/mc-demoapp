import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) {
      // TODO: implement event handler
      try {
        final email = event.email;
        final password = event.password;
        if (password.length < 6) {
          return emit(
              AuthFailure('Password must be at least 6 characters long'));
        }
        emit(AuthSuccess('uid'));
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
