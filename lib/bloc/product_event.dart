part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductCreateEvent extends ProductEvent {
  final Product product;

  ProductCreateEvent(this.product);
}

class ProductFetchEvent extends ProductEvent {}

class ProductUpdateEvent extends ProductEvent {
  final String id;
  final Product product;

  ProductUpdateEvent(this.id, this.product);
}

class ProductDeleteEvent extends ProductEvent {
  final String id;

  ProductDeleteEvent(this.id);
}
