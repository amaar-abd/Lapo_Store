import 'package:bloc/bloc.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/common/domain/repos/product_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.productRepo) : super(CategoryInitial());

  final ProductRepo productRepo;

  Future<void> getProducts({String? category}) async {
    emit(CategoryLoading());

    final respnse = await productRepo.getProductsByCategory(category: category);

    if (isClosed) return;

    respnse.fold(
      (failure) => emit(CategoryFailure(message: failure.message)),
      (products) => emit(CategorySuccess(products: products)),
    );
  }
}
