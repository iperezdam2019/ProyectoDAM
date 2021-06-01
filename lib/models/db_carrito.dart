import 'package:shop_app/models/db_products.dart';

class Carrito extends CarritoBase {
  static Carrito _instance;

  Carrito._internal();

  factory Carrito() {
    if (_instance == null) {
      _instance = Carrito._internal();
    }

    return _instance;
  }
}

class CarritoBase {
  List<CarritoItem> carrito;

  CarritoBase() : carrito = <CarritoItem>[];

  void add(Product product) {
    for (var i = 0; i < carrito.length; i++) {
      if (carrito[i].product.id == product.id) {
        //Si ya tengo el producto en el carrio le sumo una cantidad y me salgo de la funcion
        carrito[i].cantidad++;
        return;
      }
    }
    //si no lo he encontrado lo añado nuevo
    carrito.add(CarritoItem(product: product, cantidad: 1));
  }

  void remove(Product product) {
    for (var i = 0; i < carrito.length; i++) {
      if (carrito[i].product.id == product.id) {
        //le restamos una cantidad al articulo
        carrito[i].cantidad--;
        // si la cantidad es menor que 1 nos lo cargamos de la lista
        if (carrito[i].cantidad < 1) carrito.removeAt(i);
        return;
      }
    }
  }

  void delete(Product product) {
    for (var i = 0; i < carrito.length; i++) {
      if (carrito[i].product.id == product.id) {
        carrito.removeAt(i);
        return;
      }
    }
  }

  double total() {
    double total = 0.0;
    for (CarritoItem item in carrito) {
      total += item.amount();
    }
    return total;
  }
}

class CarritoItem {
  Product product;
  int cantidad;

  CarritoItem({
    this.product,
    this.cantidad,
  });

  double amount() {
    return ((product.price * cantidad) / (1 + (product.dto / 100)));
  }
}
