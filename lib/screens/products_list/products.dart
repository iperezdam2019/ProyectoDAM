import 'package:flutter/material.dart';
import 'package:shop_app/models/db_products.dart';
import 'package:shop_app/widgets/item_list.dart';

import '../carrito_screen.dart';

class ProductList extends StatelessWidget {
  ProductList(this.typeProduct);

  final typeProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
        backgroundColor: Colors.amber,
        elevation: 2,
        actions: <Widget>[
          IconButton(
              icon: new Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                print('[DEBUG]... Pulsando en CESTA');
                Navigator.push(
                  context,
                  //TODO carrito CarritScreen(Sin producto)
                  MaterialPageRoute(builder: (context) => CarritoScreen()),
                );
              }),
        ],
      ),
      body: ProductsWidget(typeProduct),
    );
  }

  Widget getTitle() {
    if (typeProduct == 1) {
      return Text("Malloits");
    } else if (typeProduct == 2) {
      return Text("Culottes");
    } else if(typeProduct == 4){
      return Text('Chalecos');
    } else if(typeProduct == 5){
      return Text('Complementos');
    }
    else {
      return Text("Calcetines");
    }
  }
}

class ProductsWidget extends StatelessWidget {
  final typeProduct;

  const ProductsWidget(this.typeProduct);

  @override
  Widget build(BuildContext context) {
    final productsList = Products()
        .products
        .where((element) => element.productType == typeProduct)
        .toList();
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
      child: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, index) => ItemList(productsList[index]),
      ),
    );
  }
}
