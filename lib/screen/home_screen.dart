import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_crud/screen/product_dialog.dart';

import '../bloc/product_bloc.dart';
import '../model/product.dart';
import '../widgets/product_lists.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product"),centerTitle: true,),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (BuildContext context, state) {
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is ProductLoadedState) {
            return (state.products.isEmpty) ? const Center(child: Text(
              "No Product",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)
                : ProductLists( state: ProductLoadedState(state.products),);
          }
          return Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        productDialog(context, null);
      },child: const Icon(Icons.add_rounded),),
    );
  }
}
