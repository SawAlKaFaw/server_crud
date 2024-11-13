import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/product.dart';
import '../service/api_service.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
 final ApiService _apiService;
  ProductBloc(this._apiService) : super(ProductLoadingState()) {

    //For user create a product item when add icon click and save button
    on<ProductCreateEvent>((event, emit) async{
      try {
        emit(ProductLoadingState());
        await _apiService.createProduct(event.product);
        var products = await _apiService.getAllProducts();
        emit(ProductLoadedState(products));
      }
      catch(e){
        emit(ProductErrorState(e.toString()));
      }

    });

    //Fetch all products when open the app from api
    on<ProductFetchEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var products = await _apiService.getAllProducts();
        emit(ProductLoadedState(products));
      }catch(e){
        emit(ProductErrorState(e.toString()));
      }

    });

    //User click edit icon and update new data
    on<ProductUpdateEvent>((event, emit) async{
      try {
        emit(ProductLoadingState());
        await _apiService.updateProduct(event.id, event.product);
        var products = await _apiService.getAllProducts();
        emit(ProductLoadedState(products));
        Fluttertoast.showToast(msg: "Update successful");
      }catch(e){
        emit(ProductErrorState(e.toString()));
      }

    });

    //User delete product item by clicking delete icon
    on<ProductDeleteEvent>((event, emit)async {
      try {
        emit(ProductLoadingState());
        await _apiService.deleteProduct(event.id);
        var products = await _apiService.getAllProducts();
        emit(ProductLoadedState(products));
        Fluttertoast.showToast(msg: "Delete successful");
      }catch(e){
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
