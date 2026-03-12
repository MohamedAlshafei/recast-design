import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recast_design/core/constants/app_assets.dart';

import '../models/order_model.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  OrderRepoImpl();

  @override
  Future<OrderModel> getOrderData() async {
    try {
      final String response = await rootBundle.loadString(AppAssets.dataUrl);
      final data = json.decode(response);
      return OrderModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load order data: $e');
    }
  }
}
