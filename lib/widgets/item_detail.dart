import 'package:flutter/material.dart';
import 'package:shop_app/widgets/cart_button.dart';

class ItemDetail extends StatelessWidget {
  ItemDetail(this.product);
  final product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Column(
          children: <Widget>[
            Image(
              width: 300,
              image: NetworkImage('${product.logo}'),
            ),
            ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 0),
                title: Text(
                  "${product.title}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Precio: ${product.price} €",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  print('[DEBUG]... Pulsando ' + product.toString());
                }),
            Padding(
              padding: EdgeInsets.all(11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("${product.description}")],
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[CartButton(product)],
            )
          ],
        ),
      ),
    );
  }
}
