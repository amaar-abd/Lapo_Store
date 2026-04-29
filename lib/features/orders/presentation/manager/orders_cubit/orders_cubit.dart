import 'package:bloc/bloc.dart';
import 'package:lapo_app/core/depandency_injection/service_locator.dart';
import 'package:lapo_app/features/orders/domain/entites/order_entity.dart';
import 'package:lapo_app/features/orders/domain/repos/orders_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;

  Future<void> getOrders() async {
    final userId = sl.get<SupabaseClient>().auth.currentUser!.id;

    emit(OrdersLoading());
    final result = await ordersRepo.fetchOrders(userId);

    result.fold(
      (failure) => emit(OrdersFailure(message: failure.message)),
      (orders) => emit(OrdersSuccess(orders: orders)),
    );
  }

  
}
