import 'dart:convert';

import 'package:http/http.dart' as http;

// void main() async {
//   final response = await http.get(Uri.parse("https://dummyjson.com/products"));
//   final mJson = json.decode(response.body);
//   final mData = Product.fromJson(mJson);
//
//   /**
//    * sort categories
//    */
//   final Map<String,List<ProductElement>> productCollection = {};
//
//   /**
//    * java grouping -> return collection
//    * {
//    * 25:[1,2,3]
//    * }
//    */
//
//   /**
//    * add key to collection
//    */
//
//   for(var mProduct in mData.products){
//     final key = mProduct.category;
//
//     if(!productCollection.containsKey(key)){
//       //this key == empty list
//       productCollection[key] = [mProduct];
//     }
//     productCollection[key]?.add(mProduct);
//   }
//
//   /**
//    * sort by price
//    */
//   for(var mKey in productCollection.keys){
//     productCollection[mKey]?.sort((a,b) => b.price.compareTo(a.price));
//   }
//
//   final List<ProductElement> sortProduct = [];
//   for (var e in productCollection.values) {
//     sortProduct.addAll(e);
//   }
//
//   for (var element in sortProduct) {
//     print("sort \n${element.category}\n${element.price}");
//   }
//
// }

class Product {
  List<ProductElement> products;
  int total;
  int skip;
  int limit;

  Product({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class ProductElement {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  ProductElement({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

class LoginManager {
  static LoginManager? _instance;
  LoginManager._();

  static LoginManager get instance => _instance ??= LoginManager._();

  String token = "";
}


void main(){
  final mToken = '1213213';

  final t1 = LoginManager.instance;
  final t2 = LoginManager.instance;

  t1.token = mToken;

  print('token :${t2.token}');
}









