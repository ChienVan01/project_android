class Order {
  int id;
  int paymentId;
  int userId;
  int voucherId;
  int orderStatusId;
  String timeBuy;
  int totalPrice;
  int status;
  String createdAt;
  String updatedAt;

  Order({
    required this.id,
    required this.paymentId,
    required this.userId,
    required this.voucherId,
    required this.orderStatusId,
    required this.timeBuy,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
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
    return data;
  }
}
