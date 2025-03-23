import 'package:app_kodigos/helpers/jwt_service.dart';
import 'package:app_kodigos/src/login/datasource/auth_remote_datasource_impl.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository.dart';

import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource = AuthRemoteDatasourceImpl();
  final JwtService jwtService = JwtService();

  @override
  Future<String> login(String email, String password) async {
    final token = await authRemoteDatasource.login(email, password);
    jwtService.saveToken(token);
    return token;
  }
}
