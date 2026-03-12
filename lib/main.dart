import 'package:flutter/material.dart';
import 'features/home/presentation/screens/order_screen.dart';
import 'core/helper/app_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.key,
      debugShowCheckedModeBanner: false,
      title: 'Recast Design',
      home: OrderScreen(),
    );
  }
}
