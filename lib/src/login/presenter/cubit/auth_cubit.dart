import 'package:app_kodigos/src/login/presenter/cubit/auth_state.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.login(email, password);
      emit(AuthLogged());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
