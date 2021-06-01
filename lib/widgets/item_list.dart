import 'package:flutter/material.dart';
import 'package:shop_app/widgets/item_detail.dart';

class ItemList extends StatelessWidget {
  ItemList(this.itemProduct);

  final itemProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: GestureDetector(
        onTap: () {
          print("'[DEBUG]... Pulsando en id " +
              itemProduct.id.toString());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ItemDetail(itemProduct);
              },
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 125,
              width: 100,
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(itemProduct.logo),
                      fit: BoxFit.cover)),
              // Pinto los descuentos
              child: itemProduct.dto == 0
                  ? Container()
                  : Container(
                      color: Colors.red.shade300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            itemProduct.dto.toString() + " %",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Descuento",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      itemProduct.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      "Stock " + itemProduct.stock.toString() + ' unidades',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      'Precio ' + itemProduct.price.toString() + " €",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
