import 'package:flutter/material.dart';
import 'package:shop_app/controllers/messageWidget.dart';
import 'package:shop_app/models/db_carrito.dart';
import 'package:shop_app/models/db_model.dart';

class CarritoScreen extends StatefulWidget {
  @override
  _CarritoScreenState createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CESTA'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: Carrito().carrito.length,
                itemBuilder: (context, index) {
                  final CarritoItem carritoItem = Carrito().carrito[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 130,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 130,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage('${carritoItem.product.logo}'),
                            fit: BoxFit.cover,
                          )),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Text(
                                        "${carritoItem.product.title}",
                                        overflow: TextOverflow.fade,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      child: IconButton(
                                        tooltip: 'Eliminar de la cesta',
                                        onPressed: () {
                                          MessageWidget.warn(context,
                                              'Eliminando de la cesta', 3);
                                          print(
                                              "[Debug]...Pulsando la papelera");
                                          setState(() {
                                            Carrito()
                                                .delete(carritoItem.product);
                                          });
                                        },
                                        color: Colors.red,
                                        icon: Icon(Icons.delete),
                                        iconSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Precio: "),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${carritoItem.product.price}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Total: "),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        "${carritoItem.amount().toStringAsFixed(2)} €",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Portes incluidos",
                                    ),
                                    Spacer(),
                                    Row(
                                      children: <Widget>[
                                        //Eliminar
                                        InkWell(
                                          onTap: () {
                                            print(
                                                "[Debug]...Pulsando en eliminar producto");
                                            setState(() {
                                              Carrito().removeUnit(
                                                  carritoItem.product);
                                            });
                                          },
                                          splashColor:
                                              Colors.redAccent.shade200,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.redAccent,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        // Cantidad
                                        Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Text("${carritoItem.cantidad}"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        // Agregar
                                        InkWell(
                                          onTap: () {
                                            print('Pulsando en +');
                                            print(
                                                "STock: ${carritoItem.product.stock}");
                                            setState(() {
                                              if (!Carrito().addUnit(
                                                  carritoItem.product)) {
                                                showDialog(
                                                  context: context,
                                                  builder: (_) => AlertDialog(
                                                    title: Text("Actualmente stock insuficiente"),
                                                    content:
                                                        Text("En breve estará disponible"),
                                                  ),
                                                );
                                              }
                                            });
                                          },
                                          splashColor: Colors.lightBlue,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Material(
              color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Total:",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "${Carrito().total().toStringAsFixed(2)} €",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      color: Colors.amber,
                      elevation: 1.0,
                      child: InkWell(
                        splashColor: Colors.yellowAccent,
                        //TODO
                        // Actualizar las unidades en FireBase y si no hay suficiente mensaje de alerta
                        onTap: () async {
                          //llamamos a la funcion para guardar la info en firebase
                          final resultSave =
                              await DbModel.saveData(Carrito().carrito);
                          //devuelve un bool, true si es OK false si errro
                          if (resultSave) {
                            //si va bien mostramos un mensaje i limpiamos la lista
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Compra Correcta"),
                                content:
                                    Text("En breves dias tendrá su pedido"),
                              ),
                            );
                            setState(() {
                              Carrito().carrito.clear();
                            });
                          } else {
                            //si hay error avisamos al usuario
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                    title: Text("Error"),
                                    content:
                                        Text("Error al realizar la compra")));
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Pagar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
