import 'package:app_kodigos/src/order/entities/order_request_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_kodigos/src/order/repositories/order_repository.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository orderRepository;

  OrderCubit({required this.orderRepository}) : super(OrderInitial());

  Future<void> createOrder(OrderRequestDto order) async {
    emit(OrderLoading());
    try {
      await orderRepository.createOrder(order);
      emit(OrderCreated());
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
