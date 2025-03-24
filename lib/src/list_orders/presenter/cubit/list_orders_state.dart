import '../../../order/entities/order.dart';

abstract class OrderListState {}

class OrderListInitial extends OrderListState {}

class OrderListLoading extends OrderListState {}

class OrderListLoaded extends OrderListState {
  final List<Order> orders;
  OrderListLoaded(this.orders);
}

class OrderListError extends OrderListState {
  final String message;
  OrderListError(this.message);
}
