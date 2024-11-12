import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../model/product.dart';
import '../screen/home_screen.dart';
import '../screen/product_dialog.dart';

class ProductLists extends StatelessWidget {
  final ProductLoadedState state;
  const ProductLists({
    super.key,required this.state
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          Product product = state.products[index]; //single product
          return SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        "${product.name}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),

                    SizedBox(
                      width: 100,
                      child: Text("${product.price}",
                          style: const TextStyle(fontSize: 20)),
                    ),

                    SizedBox(
                        width: 70,
                        child: IconButton(onPressed: () {
                          productDialog(context, product);
                        }, icon: const Icon(Icons.edit_rounded))),
                    IconButton(onPressed: () {
                      context.read<ProductBloc>().add(
                          ProductDeleteEvent(product.id!));
                    }, icon: const Icon(Icons.delete_rounded)),


                  ],
                ),
              ),
            ),
          );
        });
  }
}