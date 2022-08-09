import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product._details.dart';

class ProductTile extends StatelessWidget {
  // const ProductTile({Key? key}) : super(key: key);
  final String title;
  final String id;
  final String imageUrl;

  const ProductTile(
      {required this.title, required this.id, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product-details', arguments: id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 125,
              width: 150,
              child: Image.network(imageUrl),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                height: 35,
                width: 150,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    // bottom: 5,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 35,
                // right: 0,
                child: IconButton(
                  onPressed: () {
                    product.toggleFavourite();
                  },
                  icon: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: product.isFavourite ? Colors.red : Colors.grey,
                  ),
                ))
          ],
        ),
        elevation: 7,
      ),
    );
  }
}
