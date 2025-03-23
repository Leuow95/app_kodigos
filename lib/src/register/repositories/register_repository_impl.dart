import 'package:app_kodigos/src/register/datasource/register_datasource.dart';

import 'register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource registerDataSource;

  RegisterRepositoryImpl({required this.registerDataSource});

  @override
  Future<void> register(String email, String password) async {
    try {
      await registerDataSource.register(email, password);
    } catch (e) {
      throw Exception('Erro ao registrar usuário');
    }
  }
}
