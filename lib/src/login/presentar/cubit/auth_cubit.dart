import 'package:app_kodigos/src/login/presentar/cubit/auth_state.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.login(email, password);
      emit(AuthLogged());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
