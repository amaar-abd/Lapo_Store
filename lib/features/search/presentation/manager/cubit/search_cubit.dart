import 'package:bloc/bloc.dart';

import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
import 'package:lapo_app/core/common/domain/repos/product_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.productRepo) : super(SearchInitial());

  final ProductRepo productRepo;

  Future<void> searchByName({required String query}) async {
    emit(SearchLoading());
    final response = await productRepo.searchProducts(query: query);
    if (isClosed) return;
    response.fold(
      (failure) => emit(SearchFailure(message: failure.message)),
      (products) => emit(SearchSuccess(products: products)),
    );
  }

  void resetSearch() {
    emit(SearchInitial());
  }
}
