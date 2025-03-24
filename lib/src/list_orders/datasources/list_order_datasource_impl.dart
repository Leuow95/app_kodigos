import 'package:app_kodigos/src/list_orders/datasources/list_order_datasource.dart';
import 'package:dio/dio.dart';

import '../../../helpers/jwt_service.dart';
import '../../order/entities/order.dart';

class ListOrderDatasourceImpl implements ListOrderDatasource {
  final Dio dio;
  final JwtService jwtService;

  ListOrderDatasourceImpl({required this.dio, required this.jwtService});

  @override
  Future<List<Order>> listOrders() async {
    try {
      final response = await dio.get('http://10.0.2.2:8080/order/list');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((item) => Order.fromJson(item))
            .toList();
      } else {
        throw Exception('Erro ao listar ordens');
      }
    } on DioException catch (e) {
      throw Exception('Erro ao listar ordens: ${e.message}');
    }
  }
}
