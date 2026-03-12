import 'order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recast_design/features/home/data/models/order_model.dart';
import 'package:recast_design/features/home/data/repo/order_repo.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepository;
  OrderModel? orderData;

  OrderCubit(this.orderRepository) : super(OrderInitial());

  Future<void> fetchOrderData() async {
    emit(OrderLoading());
    try {
      orderData = await orderRepository.getOrderData();
      emit(OrderLoaded());
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
