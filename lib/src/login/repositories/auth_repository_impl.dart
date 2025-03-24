import 'package:app_kodigos/helpers/jwt_service.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final JwtService jwtService;

  AuthRepositoryImpl({required this.authRemoteDatasource, required this.jwtService});

  @override
  Future<String> login(String email, String password) async {
    try {
      final token = await authRemoteDatasource.login(email, password);
      await jwtService.saveToken(token);
      return token;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Email ou senha inválidos');
      }
      throw Exception('Erro ao fazer login');
    } catch (e) {
      throw Exception('Erro ao fazer login');
    }
  }
}
