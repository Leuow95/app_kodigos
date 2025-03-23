import 'package:dio/dio.dart';

import 'register_datasource.dart';

class RegisterDatasourceImpl implements RegisterDataSource {
  final Dio dio;

  RegisterDatasourceImpl({required this.dio});

  @override
  Future<void> register(String email, String password) async {
    await dio.post('http://localhost:8080/register', data: {'email': email, 'password': password});
  }
}
