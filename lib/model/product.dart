class Product {
  int id;
  String name;
  String configuration;
  String info;
  String origin;
  int productTypeId;
  int price;
  int quantity;
  String avatar;
  int status;
  Null createdAt;
  Null updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.configuration,
    required this.info,
    required this.origin,
    required this.productTypeId,
    required this.price,
    required this.quantity,
    required this.avatar,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['Name'],
        configuration: json['Configuration'],
        info: json['Info'],
        origin: json['Origin'],
        productTypeId: json['ProductType_id'],
        price: json['Price'],
        quantity: json['Quantity'],
        avatar: json['Avatar'],
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    data['Configuration'] = configuration;
    data['Info'] = info;
    data['Origin'] = origin;
    data['ProductType_id'] = productTypeId;
    data['Price'] = price;
    data['Quantity'] = quantity;
    data['Avatar'] = avatar;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


// List<Product> product = [
//   Product(
//     name: 'Laptop ASUS UX3..',
//     image: 'product01.jpg',
//     price: 27999000,
//   ),
//   Product(
//     name: 'Màn hình LCD PHILIPS..',
//     image: 'product02.jpg',
//     price: 5050000,
//   ),
//   Product(
//     name: 'Lót chuột DAREU ESP1009-XL',
//     image: 'product03.jpg',
//     price: 189000,
//   ),
//   Product(
//     name: 'Bàn phím cơ Akko 3084..',
//     image: 'product04.jpg',
//     price: 1499000,
//   ),
//   Product(
//     name: 'Laptop Dell Alienware..',
//     image: 'product05.jpg',
//     price: 62990000,
//   ),
//   Product(
//     name: 'Laptop ASUS UX3..',
//     image: 'product01.jpg',
//     price: 27999000,
//   ),
//   Product(
//     name: 'Màn hình LCD PHILIPS..',
//     image: 'product02.jpg',
//     price: 5050000,
//   ),
//   Product(
//     name: 'Lót chuột DAREU ESP1009-XL',
//     image: 'product03.jpg',
//     price: 189000,
//   ),
//   Product(
//     name: 'Bàn phím cơ Akko 3084..',
//     image: 'product04.jpg',
//     price: 1499000,
//   ),
//   Product(
//     name: 'Laptop Dell Alienware..',
//     image: 'product05.jpg',
//     price: 62990000,
//   ),
//   Product(
//     name: 'Laptop ASUS UX3..',
//     image: 'product01.jpg',
//     price: 27999000,
//   ),
//   Product(
//     name: 'Màn hình LCD PHILIPS..',
//     image: 'product02.jpg',
//     price: 5050000,
//   ),
//   Product(
//     name: 'Lót chuột DAREU ESP1009-XL',
//     image: 'product03.jpg',
//     price: 189000,
//   ),
//   Product(
//     name: 'Bàn phím cơ Akko 3084..',
//     image: 'product04.jpg',
//     price: 1499000,
//   ),
//   Product(
//     name: 'Laptop Dell Alienware..',
//     image: 'product05.jpg',
//     price: 62990000,
//   ),
// ];
