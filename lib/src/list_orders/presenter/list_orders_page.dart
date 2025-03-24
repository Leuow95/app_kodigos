import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/list_orders_cubit.dart';
import 'cubit/list_orders_state.dart';

class ListOrdersPage extends StatelessWidget {
  const ListOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ordens de Serviço')),
      body: BlocBuilder<OrderListCubit, OrderListState>(
        builder: (context, state) {
          if (state is OrderListLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is OrderListLoaded) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final order = state.orders[index];
                return ListTile(title: Text(order.description ?? ''));
              },
            );
          }
          if (state is OrderListError) {
            return Center(child: Text('Erro: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
