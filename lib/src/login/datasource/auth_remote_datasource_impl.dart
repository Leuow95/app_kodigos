import 'package:dio/dio.dart';

import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl({required this.dio});

  @override
  Future<String> login(String email, String password) async {
    final response = await dio.post('http://localhost:8080/login', data: {'email': email, 'password': password});
    if (response.statusCode != 200) {
      throw Exception('Failed to login');
    }

    return response.data['token'];
  }
}
