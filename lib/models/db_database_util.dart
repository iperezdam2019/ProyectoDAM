import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:shop_app/models/db_products.dart';

class FirebaseDatabaseUtil {
  DatabaseReference _counterRef;
  DatabaseReference _productRef;
  StreamSubscription<Event> _counterSubscription;
  StreamSubscription<Event> _messagesSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  int _counter;
  DatabaseError error;

  static final FirebaseDatabaseUtil _instance =
      new FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return _instance;
  }

  void initState() {
    // Demonstrates configuring to the database using a file
    _counterRef = FirebaseDatabase.instance.reference().child('product');
    // Demonstrates configuring the database directly

    _productRef = database.reference().child('product');
    database.reference().child('product').once().then((DataSnapshot snapshot) {
      print('Connected to second database and read ${snapshot.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _counterRef.keepSynced(true);

    _counterSubscription = _counterRef.onValue.listen((Event event) {
      error = null;
      _counter = event.snapshot.value ?? 0;
    }, onError: (Object o) {
      error = o;
    });
  }

  DatabaseError getError() {
    return error;
  }

  int getCounter() {
    return _counter;
  }

  DatabaseReference getUser() {
    return _productRef;
  }

  void updateProduct(Product product) async {
    await _productRef.child(product.id.toString()).update({
      "Descrition": "" + product.description,
      "Dto": "" + product.dto.toString(),
      "Logo": "" + product.logo,
      "Price": "" + product.price.toString(),
      "ProductType": "" + product.productType.toString(),
      "Stock": "" + product.stock.toString(),
      "Title": "" + product.title,
      "id": "" + product.id.toString()
    }).then((_) {
      print('Transaction  committed.');
    });
  }

  void dispose() {
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }
}
