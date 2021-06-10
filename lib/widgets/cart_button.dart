import 'package:flutter/material.dart';
import 'package:shop_app/controllers/messageWidget.dart';
import 'package:shop_app/models/db_carrito.dart';
import 'package:shop_app/models/db_products.dart';

class CartButton extends StatelessWidget {
  CartButton(this.compra);

  final Product compra;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: GestureDetector(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () {
                    if (Carrito().addUnit(compra) == false) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("No hay stock"),
                          content: Text("En breves dias estará disponible"),
                        ),
                      );
                    }else{
                    MessageWidget.info(context, 'Añadido a la cesta', 3);
                    print("El id del articulo es " + compra.toString());
                    }
                  },
                  child: Text("Añadir a la cesta"),
                  color: Colors.amber,
                  textColor: Colors.white,
                ),
              )),
        ),
      ],
    );
  }
}
