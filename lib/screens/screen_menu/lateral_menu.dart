import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/carrito_screen.dart';
import 'package:shop_app/screens/products_list/products.dart';

import '../login_page.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(
              "SECOND SKIN",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "contacto@secondskin.com",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.PNG")),
            decoration: BoxDecoration(),
          ),
          InkWell(
            child: new ListTile(
              title: Text(
                "MAILLOTS",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                print('[DEBUG]... Pulsando en MAILLOTS');
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProductList(1),
                ));
              },
            ),
          ),
          new ListTile(
            title: Text(
              "CULOTES",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              print('[DEBUG]... Pulsando en CULOTES');
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductList(2);
                  },
                ),
              );
            },
          ),
          new ListTile(
            title: Text(
              "CALCETINES",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              print('[DEBUG]... Pulsando en CALCETINES');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductList(3);
                  },
                ),
              );
            },
          ),
          new ListTile(
            title: Text(
              "CHALECOS",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              print('[DEBUG]... Pulsando en CHALECOS');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductList(4);
                  },
                ),
              );
            },
          ),
          
          new ListTile(
            title: Text(
              "COMPLEMENTOS",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              print('[DEBUG]... Pulsando en COMPLEMENTOS');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductList(5);
                  },
                ),
              );
            },
          ),
          
          new ListTile(
            title: Text(
              "LOGIN",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              print('[DEBUG]... Pulsando en LOGIN');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
