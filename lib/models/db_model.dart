import 'package:firebase_database/firebase_database.dart';

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

  static Future<bool> saveData() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
