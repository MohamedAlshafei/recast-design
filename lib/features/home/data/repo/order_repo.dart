import 'package:recast_design/features/home/data/models/order_model.dart';

abstract class OrderRepo {
  Future<OrderModel> getOrderData();
}
