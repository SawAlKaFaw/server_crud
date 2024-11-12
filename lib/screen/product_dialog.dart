
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../model/product.dart';

void productDialog(BuildContext context,Product? product) {
  final nameController = TextEditingController(text: product?.name);
  final priceController = TextEditingController(text: product?.price);

  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: Text(product == null ? "Create Product" : "Update Product"),
      content: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.15,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: priceController,
              keyboardType:TextInputType.number ,
              decoration: const InputDecoration(labelText: "Price"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: const Text("Cancel")),

        ElevatedButton(onPressed: () {
          if (product == null) {
            context.read<ProductBloc>().add(ProductCreateEvent(Product(name: nameController.text,price: priceController.text)));
          }
          else {
            context.read<ProductBloc>().add(ProductUpdateEvent(product.id!,
                Product(id: product.id,
                    name: nameController.text,
                    price: priceController.text)));
          }
          Navigator.of(context).pop();
        }, child:Text(product==null? "Create": "Update"))
      ],
    );
  });
}