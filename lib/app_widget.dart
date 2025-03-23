import 'package:app_kodigos/src/login/presentar/login_page.dart';
import 'package:flutter/material.dart';

import 'src/order/order_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Service Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {'/order': (context) => const OrderPage(), '/login': (context) => LoginPage()},
    );
  }
}
