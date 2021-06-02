class Products extends ProductsBase {
  static Products _instance;

  Products._internal();

  factory Products() {
    if (_instance == null) {
      _instance = Products._internal();
    }

    return _instance;
  }
}

class ProductsBase {
  ProductsBase() : products = <Product>[];

  List<Product> products;

  void save(items) {
    products.clear();
    items.forEach((e) {
      products.add(Product.fromJson(e));
    });
  }
}

class Product {
  Product({
    this.description,
    this.logo,
    this.price,
    this.productType,
    this.title,
    this.id,
    this.stock,
    this.dto,
  });

  String description;
  String logo;
  int price;
  int productType;
  String title;
  int stock;
  int dto;
  int id;

  //Update *******
  /*
  String get getDescription => description;
  String get getLogo => logo;
  String get getPrice => price.toString();
  String get getProductType => productType.toString();
  String get getTitle => title;
  String get getStock => stock.toString();
  String get getDto => dto.toString();
  String get getId => id.toString();
*/
  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        description: json["Description"],
        logo: json["Logo"],
        price: json["Price"],
        productType: json["ProductType"],
        title: json["Title"],
        id: json["id"],
        dto: json["Dto"],
        stock: json["Stock"],
      );

  Map<String, dynamic> toJson() => {
        "Description": description,
        "Logo": logo,
        "Price": price,
        "ProductType": productType,
        "Title": title,
        "id": id,
        "Stock": stock,
        "Dto": dto,
      };
}
