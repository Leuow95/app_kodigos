import '../datasource/order_datasource.dart';
import '../entities/order_request_dto.dart';
import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource orderDataSource;

  OrderRepositoryImpl({required this.orderDataSource});

  @override
  Future<void> createOrder(OrderRequestDto order) async {
    return await orderDataSource.createOrder(order);
  }
}
