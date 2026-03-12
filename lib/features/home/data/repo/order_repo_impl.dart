import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recast_design/features/home/data/models/order_model.dart';
import 'package:recast_design/features/home/data/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  @override
  Future<OrderModel> getOrderData() async {
    try {
      final String response = await rootBundle.loadString('assets/data/order_data.json');
      final data = json.decode(response);
      return OrderModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load order data: $e');
    }
  }
}
