part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState(this.products);
}

final class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState(this.error);
}
