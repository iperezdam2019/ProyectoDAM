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

  bool addUnit(Product product) {
        if (product.stock == 0) {
      return false;
    }
    for (var carritoItem in carrito) {
      if (carritoItem.product.id == product.id) {
        //Si ya tengo el producto en el carrio le sumo una cantidad y me salgo de la funcion
        if (carritoItem.product.stock > 0) {
          carritoItem.product.stock--;
          carritoItem.cantidad++;
          return true;
        } else
          return false;
      }
    }
    //si no lo he encontrado lo añado nuevo
    final item = CarritoItem(product: product, cantidad: 1);
    item.product.stock--;
    carrito.add(item);
    return true;
  }

  void removeUnit(Product product) {
    for (var carritoItem in carrito) {
      if (carritoItem.product.id == product.id) {
        //le restamos una cantidad al articulo
        carritoItem.product.stock++;
        carritoItem.cantidad--;
        // si la cantidad es menor que 1 nos lo cargamos de la lista
        if (carritoItem.cantidad < 1) carrito.remove(carritoItem);
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
