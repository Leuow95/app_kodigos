import '../entities/order_request_dto.dart';

abstract class OrderRepository {
  Future<void> createOrder(OrderRequestDto order);
}
