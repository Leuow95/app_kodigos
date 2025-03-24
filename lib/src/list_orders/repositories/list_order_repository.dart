import 'package:app_kodigos/src/order/entities/order.dart';

abstract class ListOrderRepository {
  Future<List<Order>> getOrders();
}
