import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/prodct_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<ProductProvider>(context).productList;
    final loadedProduct = product.firstWhere((pro) => pro.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Image.network(loadedProduct.imageUrl),
          ),
          Text(
            'Price: \$${loadedProduct.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            loadedProduct.description,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
