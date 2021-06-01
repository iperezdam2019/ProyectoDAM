import 'package:flutter/material.dart';
import 'package:shop_app/screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Second Skin',
        debugShowCheckedModeBanner: false, // Eliminar Banner Debug
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Home());
  }
}
