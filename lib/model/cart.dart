class Cart {
  String id;
  int productId;
  int userId;
  String name;
  String origin;
  int productTypeId;
  int price;
  int initialPrice;
  int quantity;
  String avatar;
  int status;

  Cart({
    required this.id,
    required this.productId,
    required this.userId,
    required this.name,
    required this.origin,
    required this.productTypeId,
    required this.price,
    required this.initialPrice,
    required this.quantity,
    required this.avatar,
    required this.status,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['id'],
        productId: json['productId'],
        userId: json['userId'],
        name: json['name'],
        origin: json['origin'],
        productTypeId: json['productTypeId'],
        price: json['price'],
        initialPrice: json['initialPrice'],
        quantity: json['quantity'],
        avatar: json['avatar'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['userId'] = userId;
    data['name'] = name;
    data['origin'] = origin;
    data['productTypeId'] = productTypeId;
    data['price'] = price;
    data['initialPrice'] = initialPrice;
    data['quantity'] = quantity;
    data['avatar'] = avatar;
    data['status'] = status;
    return data;
  }
}



// class Cart extends Equatable {
//   final List<Product> products;

//   const Cart({this.products = const <Product>[]});

//   @override
//   List<Object?> get props => [products];

//   Map productQuantity(products) {
//     var quantity = {};
//     products.forEach((product) {
//       if (!quantity.containsKey(product)) {
//         quantity[products] = 1;
//       } else {
//         quantity[products]++;
//       }
//     });
//     return quantity;
//   }
// }

// Demo data for our cart

// List<Cart> demoCarts = [];
