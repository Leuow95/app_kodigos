import 'package:app_kodigos/helpers/jwt_service.dart';
import 'package:app_kodigos/src/list_orders/datasources/list_order_datasource.dart';
import 'package:app_kodigos/src/list_orders/datasources/list_order_datasource_impl.dart';
import 'package:app_kodigos/src/list_orders/presenter/cubit/list_orders_cubit.dart';
import 'package:app_kodigos/src/list_orders/repositories/list_order_repository.dart';
import 'package:app_kodigos/src/list_orders/repositories/list_order_repository_impl.dart';
import 'package:app_kodigos/src/login/datasource/auth_remote_datasource.dart';
import 'package:app_kodigos/src/login/datasource/auth_remote_datasource_impl.dart';
import 'package:app_kodigos/src/login/presenter/cubit/auth_cubit.dart';
import 'package:app_kodigos/src/login/presenter/login_page.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository_impl.dart';
import 'package:app_kodigos/src/order/datasource/order_datasource_impl.dart';
import 'package:app_kodigos/src/order/repositories/order_repository.dart';
import 'package:app_kodigos/src/register/datasource/register_datasource.dart';
import 'package:app_kodigos/src/register/datasource/register_datasource_impl.dart';
import 'package:app_kodigos/src/register/presenter/cubit/register_cubit.dart';
import 'package:app_kodigos/src/register/presenter/register_page.dart';
import 'package:app_kodigos/src/register/repositories/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/list_orders/presenter/list_orders_page.dart';
import 'src/order/datasource/order_datasource.dart';
import 'src/order/presenter/cubit/order_cubit.dart';
import 'src/order/presenter/order_page.dart';
import 'src/order/repositories/order_repository_impl.dart';
import 'src/register/repositories/register_repository_impl.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => JwtService()),
        RepositoryProvider<Dio>(create: (context) => Dio()),
        RepositoryProvider<RegisterDataSource>(
          create: (context) => RegisterDatasourceImpl(dio: context.read<Dio>()),
        ),
        RepositoryProvider<AuthRemoteDatasource>(
          create:
              (context) => AuthRemoteDatasourceImpl(dio: context.read<Dio>()),
        ),
        RepositoryProvider<RegisterRepository>(
          create:
              (context) => RegisterRepositoryImpl(
                registerDataSource: context.read<RegisterDataSource>(),
              ),
        ),
        RepositoryProvider<AuthRepository>(
          create:
              (context) => AuthRepositoryImpl(
                jwtService: context.read<JwtService>(),
                authRemoteDatasource: context.read<AuthRemoteDatasource>(),
              ),
        ),
        RepositoryProvider<ListOrderDatasource>(
          create:
              (context) => ListOrderDatasourceImpl(
                dio: context.read<Dio>(),
                jwtService: context.read<JwtService>(),
              ),
        ),
        RepositoryProvider<ListOrderRepository>(
          create:
              (context) => ListOrderRepositoryImpl(
                listOrderDatasource: context.read<ListOrderDatasource>(),
              ),
        ),
        RepositoryProvider<OrderDataSource>(
          create:
              (context) => OrderDataSourceImpl(
                dio: context.read<Dio>(),
                jwtService: context.read<JwtService>(),
              ),
        ),
        RepositoryProvider<OrderRepository>(
          create:
              (context) => OrderRepositoryImpl(
                orderDataSource: context.read<OrderDataSource>(),
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create:
                (context) => RegisterCubit(
                  registerRepository: context.read<RegisterRepository>(),
                ),
          ),
          BlocProvider<AuthCubit>(
            create:
                (context) =>
                    AuthCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<OrderListCubit>(
            create:
                (context) => OrderListCubit(
                  listOrderRepository: context.read<ListOrderRepository>(),
                )..loadOrders(),
          ),
          BlocProvider<OrderCubit>(
            create:
                (context) => OrderCubit(
                  orderRepository: context.read<OrderRepository>(),
                ),
          ),
        ],
        child: MaterialApp(
          title: 'Order Service Manager',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/login',
          routes: {
            '/order': (context) => const OrderPage(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/list-orders': (context) => ListOrdersPage(),
          },
        ),
      ),
    );
  }
}
