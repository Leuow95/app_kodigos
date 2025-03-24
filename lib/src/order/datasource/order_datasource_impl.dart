import 'package:app_kodigos/src/order/entities/order_request_dto.dart';
import 'package:dio/dio.dart';

import '../../../helpers/jwt_service.dart';
import 'order_datasource.dart';

class OrderDataSourceImpl implements OrderDataSource {
  final Dio dio;
  final JwtService jwtService;

  OrderDataSourceImpl({required this.dio, required this.jwtService});

  @override
  Future<void> createOrder(OrderRequestDto order) async {
    try {
      final token = await jwtService.getToken();
      await dio.post(
        'http://10.0.2.2:8080/order/create',
        data: order.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioException catch (e) {
      throw Exception('Erro ao criar ordem: ${e.message}');
    }
  }
}
