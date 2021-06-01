import 'package:firebase_database/firebase_database.dart';

import 'db_carrito.dart';

class DbModel {
  static final databaseReference = FirebaseDatabase.instance.reference();

  static Future<List<dynamic>> getData() async {
    var ret = await databaseReference.once();
    return ret.value['products'];
  }

  static Future<String> getDataAsString() async {
    var ret = await databaseReference.once();
    return ret.toString();
  }

  static Future<bool> saveData(List<CarritoItem> products) async {
    try {
      for (var item in products) {
        print(item.product.toJson());
        databaseReference
            .reference()
            .child("products")
            .child(item.product.id.toString())
            .set(item.product.toJson());
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
