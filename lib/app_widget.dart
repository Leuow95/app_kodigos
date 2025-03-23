import 'package:app_kodigos/helpers/jwt_service.dart';
import 'package:app_kodigos/src/login/datasource/auth_remote_datasource.dart';
import 'package:app_kodigos/src/login/datasource/auth_remote_datasource_impl.dart';
import 'package:app_kodigos/src/login/presenter/cubit/auth_cubit.dart';
import 'package:app_kodigos/src/login/presenter/login_page.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository.dart';
import 'package:app_kodigos/src/login/repositories/auth_repository_impl.dart';
import 'package:app_kodigos/src/register/datasource/register_datasource.dart';
import 'package:app_kodigos/src/register/datasource/register_datasource_impl.dart';
import 'package:app_kodigos/src/register/presenter/cubit/register_cubit.dart';
import 'package:app_kodigos/src/register/presenter/register_page.dart';
import 'package:app_kodigos/src/register/repositories/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/order/order_page.dart';
import 'src/register/repositories/register_repository_impl.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(
          create:
              (context) =>
                  Dio()
                    ..interceptors.add(
                      InterceptorsWrapper(
                        onRequest: (options, handler) async {
                          final token = await JwtService().getToken();
                          if (token != null) {
                            options.headers['Authorization'] = 'Bearer $token';
                          }
                          return handler.next(options);
                        },
                      ),
                    ),
        ),
        RepositoryProvider<RegisterDataSource>(create: (context) => RegisterDatasourceImpl(dio: context.read<Dio>())),
        RepositoryProvider<AuthRemoteDatasource>(
          create: (context) => AuthRemoteDatasourceImpl(dio: context.read<Dio>()),
        ),
        RepositoryProvider<RegisterRepository>(
          create: (context) => RegisterRepositoryImpl(registerDataSource: context.read<RegisterDataSource>()),
        ),
        RepositoryProvider<AuthRepository>(
          create:
              (context) => AuthRepositoryImpl(
                jwtService: JwtService(),
                authRemoteDatasource: AuthRemoteDatasourceImpl(dio: context.read<Dio>()),
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterCubit>(
            create: (context) => RegisterCubit(registerRepository: context.read<RegisterRepository>()),
          ),
          BlocProvider<AuthCubit>(create: (context) => AuthCubit(authRepository: context.read<AuthRepository>())),
        ],
        child: MaterialApp(
          title: 'Order Service Manager',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/login',
          routes: {
            '/order': (context) => const OrderPage(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
          },
        ),
      ),
    );
  }
}
