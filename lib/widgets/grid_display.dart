import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../modals/product._details.dart';
import 'product_tile.dart';
import '../provider/prodct_provider.dart';

class GridDisplay extends StatelessWidget {
  // const GridDisplay({Key? key}) : super(key: key);
  final bool isFav;
  const GridDisplay(this.isFav);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<ProductProvider>(context).productList;
    final pro = Provider.of<ProductProvider>(context);
    final proItems = isFav == true ? pro.favProducts : pro.productList;
    // final proItem = pro.
    // final proItem = isFav ? product.
    return GridView.builder(
      padding: const EdgeInsets.all(30),
      itemCount: proItems.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: proItems[i],
        child: ProductTile(
          title: proItems[i].title,
          imageUrl: proItems[i].imageUrl,
          id: proItems[i].id,
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 40, mainAxisSpacing: 20,
        // childAspectRatio: 1,
      ),
    );
  }
}
