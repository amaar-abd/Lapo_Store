import 'package:bloc/bloc.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/common/domain/repos/product_repo.dart';
part 'home_sales_state.dart';

class HomeSalesCubit extends Cubit<HomeSalesState> {
  HomeSalesCubit(this.productRepo) : super(HomeSalesInitial());
  final ProductRepo productRepo;

  Future<void> featchSalesProduct() async {
    emit(HomeSalesLoading());
    final results = await productRepo.getSalesProducts();
if (isClosed) return;
    results.fold(
      (failure) => emit(HomeSalesFailure(message: failure.message)),
      (products) => emit(HomeSalesSuccess(products: products)),
    );
  }
}
