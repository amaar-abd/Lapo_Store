import 'package:bloc/bloc.dart';
import 'package:lapo_app/core/common/data/models/product_model.dart';
import 'package:lapo_app/core/common/domain/entities/product_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductModel> productsList = [];

  void addToCart(ProductModel product) {
    final isExist = productsList.any((item) => item.id == product.id);
    if (isExist) {
      final index = productsList.indexWhere((item) => item.id == product.id);
      productsList[index] = productsList[index].copyWith(
        quantity: productsList[index].quantity + 1,
      );
    } else {
      productsList.add(product);
    }
    emit(CartUpdated(products: List.from(productsList)));
  }

  void removeFromCart(String productId) {
    productsList.removeWhere((item) => item.id == productId);
    emit(CartUpdated(products: List.from(productsList)));
  }

  void clearCart() {
    productsList.clear();
    emit(CartInitial());
  }

  void incrementQuantity(ProductModel product) {
    final index = productsList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      productsList[index] = productsList[index].copyWith(
        quantity: productsList[index].quantity + 1,
      );
      emit(CartUpdated(products: List.from(productsList)));
    }
  }

  void decrementQuantity(ProductModel product) {
     final index = productsList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (productsList[index].quantity >1) {
      productsList[index] = productsList[index].copyWith(
        quantity: productsList[index].quantity  -1,
      );
      emit(CartUpdated(products: List.from(productsList)));  
      }
    }
  }

  double getTotalPrice() {
    return productsList.fold(
      0.0,
      (previousValue, item) => previousValue + (item.price * item.quantity),
    );
  }
}
