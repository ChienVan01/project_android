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
  String? createdAt;
  String? updatedAt;

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
