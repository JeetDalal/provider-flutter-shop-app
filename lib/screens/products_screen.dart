import 'package:flutter/material.dart';
// import 'package:shopapp/modals/product._details.dart';
import '../widgets/grid_display.dart';
// import '../widgets/product_tile.dart';
import '../widgets/sidedrawer.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

enum FilterOptions { showFavsOnly, showAll }

var isFavItems = false;

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopify),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.showFavsOnly) {
                  isFavItems = true;
                } else if (value == FilterOptions.showAll) {
                  isFavItems = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: FilterOptions.showFavsOnly,
                child: const Text('Only Favourites'),
              ),
              PopupMenuItem(
                value: FilterOptions.showAll,
                child: const Text('Show All'),
              ),
            ],
          ),
        ],
      ),
      body: GridDisplay(isFavItems),
    );
  }
}
