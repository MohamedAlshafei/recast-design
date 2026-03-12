import '../models/order_model.dart';

abstract class OrderRepo {
  Future<OrderModel> getOrderData();
}
