import 'package:app_kodigos/src/order/entities/order.dart';
import 'package:app_kodigos/src/order/entities/order_request_dto.dart';

abstract class OrderDataSource {
  Future<void> createOrder(OrderRequestDto order);
  Future<List<Order>> listOrders();
}
