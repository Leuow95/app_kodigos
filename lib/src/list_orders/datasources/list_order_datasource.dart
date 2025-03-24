import '../../order/entities/order.dart';

abstract class ListOrderDatasource {
  Future<List<Order>> listOrders();
}
