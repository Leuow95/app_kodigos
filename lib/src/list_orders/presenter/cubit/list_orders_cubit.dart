import 'package:app_kodigos/src/list_orders/repositories/list_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_orders_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  final ListOrderRepository listOrderRepository;

  OrderListCubit({required this.listOrderRepository})
    : super(OrderListInitial());

  Future<void> loadOrders() async {
    emit(OrderListLoading());
    try {
      final orders = await listOrderRepository.getOrders();
      emit(OrderListLoaded(orders));
    } catch (e) {
      emit(OrderListError(e.toString()));
    }
  }
}
