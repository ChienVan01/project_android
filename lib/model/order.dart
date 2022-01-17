class Order {
  int id;
  int paymentId;
  int userId;
  int voucherId;
  int orderStatusId;
  String timeBuy;
  int totalPrice;
  int status;
  String? createdAt;
  String? updatedAt;
  int orderId;
  int productId;
  String unitPrice;
  int quantity;
  String intoMoney;
  String name;
  String configuration;
  String info;
  String origin;
  int productTypeId;
  int price;
  String avatar;

  Order({
    required this.id,
    required this.paymentId,
    required this.userId,
    required this.voucherId,
    required this.orderStatusId,
    required this.timeBuy,
    required this.totalPrice,
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.orderId,
    required this.productId,
    required this.unitPrice,
    required this.quantity,
    required this.intoMoney,
    required this.name,
    required this.configuration,
    required this.info,
    required this.origin,
    required this.productTypeId,
    required this.price,
    required this.avatar,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        paymentId: json['Payment_id'],
        userId: json['User_id'],
        voucherId: json['Voucher_id'],
        orderStatusId: json['OrderStatus_id'],
        timeBuy: json['TimeBuy'],
        totalPrice: json['TotalPrice'],
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        orderId: json['Order_id'],
        productId: json['Product_id'],
        unitPrice: json['UnitPrice'],
        quantity: json['Quantity'],
        intoMoney: json['IntoMoney'],
        name: json['Name'],
        configuration: json['Configuration'],
        info: json['Info'],
        origin: json['Origin'],
        productTypeId: json['ProductType_id'],
        price: json['Price'],
        avatar: json['Avatar'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Payment_id'] = paymentId;
    data['User_id'] = userId;
    data['Voucher_id'] = voucherId;
    data['OrderStatus_id'] = orderStatusId;
    data['TimeBuy'] = timeBuy;
    data['TotalPrice'] = totalPrice;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['Order_id'] = orderId;
    data['Product_id'] = productId;
    data['UnitPrice'] = unitPrice;
    data['Quantity'] = quantity;
    data['IntoMoney'] = intoMoney;
    data['Name'] = name;
    data['Configuration'] = configuration;
    data['Info'] = info;
    data['Origin'] = origin;
    data['ProductType_id'] = productTypeId;
    data['Price'] = price;
    data['Avatar'] = avatar;
    return data;
  }
}



// class Order {
//   int id;
//   int paymentId;
//   int userId;
//   int voucherId;
//   int orderStatusId;
//   String timeBuy;
//   int totalPrice;
//   int status;
//   String createdAt;
//   String updatedAt;

//   Order({
//     required this.id,
//     required this.paymentId,
//     required this.userId,
//     required this.voucherId,
//     required this.orderStatusId,
//     required this.timeBuy,
//     required this.totalPrice,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         id: json['id'],
//         paymentId: json['Payment_id'],
//         userId: json['User_id'],
//         voucherId: json['Voucher_id'],
//         orderStatusId: json['OrderStatus_id'],
//         timeBuy: json['TimeBuy'],
//         totalPrice: json['TotalPrice'],
//         status: json['Status'],
//         createdAt: json['created_at'],
//         updatedAt: json['updated_at'],
//       );

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['Payment_id'] = paymentId;
//     data['User_id'] = userId;
//     data['Voucher_id'] = voucherId;
//     data['OrderStatus_id'] = orderStatusId;
//     data['TimeBuy'] = timeBuy;
//     data['TotalPrice'] = totalPrice;
//     data['Status'] = status;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// class OrderDetail {
//   int id;
//   int orderId;
//   int productId;
//   String unitPrice;
//   int quantity;
//   String intoMoney;
//   int status;
//   String? createdAt;
//   String? updatedAt;

//   OrderDetail({
//     required this.id,
//     required this.orderId,
//     required this.productId,
//     required this.unitPrice,
//     required this.quantity,
//     required this.intoMoney,
//     required this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
//         id: json['id'],
//         orderId: json['Order_id'],
//         productId: json['Product_id'],
//         unitPrice: json['UnitPrice'],
//         quantity: json['Quantity'],
//         intoMoney: json['IntoMoney'],
//         status: json['Status'],
//         createdAt: json['created_at'],
//         updatedAt: json['updated_at'],
//       );

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['Order_id'] = orderId;
//     data['Product_id'] = productId;
//     data['UnitPrice'] = unitPrice;
//     data['Quantity'] = quantity;
//     data['IntoMoney'] = intoMoney;
//     data['Status'] = status;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
