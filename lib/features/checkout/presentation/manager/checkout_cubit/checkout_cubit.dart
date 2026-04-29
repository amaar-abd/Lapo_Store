import 'package:bloc/bloc.dart';
import 'package:lapo_app/features/checkout/domain/repos/checkout_repo.dart';
import 'package:lapo_app/features/orders/data/models/order_item_model.dart';
import 'package:lapo_app/features/orders/data/models/order_model.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo checkoutRepo;

  Future<void> uploadOrder(OrderModel order, List<OrderItemModel> items) async {
    emit(CheckoutLoading());
    final result = await checkoutRepo.uploadOrder(order, items);
    
    result.fold(
      (failure) => emit(CheckoutFailure(message: failure.message)),
      (success) => emit(CheckoutSuccess()),
    );
  }
}
