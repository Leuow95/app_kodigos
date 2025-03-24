import 'package:dio/dio.dart';

import 'register_datasource.dart';

class RegisterDatasourceImpl implements RegisterDataSource {
  final Dio dio;

  RegisterDatasourceImpl({required this.dio});

  @override
  Future<void> register(String email, String password) async {
    await dio.post('http://10.0.2.2:8080/auth/register', data: {'username': email, 'password': password});
  }
}
