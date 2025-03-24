import '../../order/entities/order.dart';
import '../datasources/list_order_datasource.dart';
import 'list_order_repository.dart';

class ListOrderRepositoryImpl implements ListOrderRepository {
  final ListOrderDatasource listOrderDatasource;

  ListOrderRepositoryImpl({required this.listOrderDatasource});

  @override
  Future<List<Order>> getOrders() async {
    return await listOrderDatasource.listOrders();
  }
}
