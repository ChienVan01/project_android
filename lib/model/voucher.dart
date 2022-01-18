class Voucher {
  int id;
  String name;
  int userid;
  String exd;
  String content;
  int quantity;
  int status;
  String? createdat;
  String? updatedat;

  Voucher(
      {required this.id,
      required this.name,
      required this.userid,
      required this.exd,
      required this.content,
      required this.quantity,
      required this.status,
      this.createdat,
      this.updatedat});
  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json['id'],
        name: json['Name'],
        userid: json['User_id'],
        exd: json['EXD'],
        content: json['Content'],
        quantity: json['Quantity'],
        status: json['Status'],
        createdat: json['created_at'],
        updatedat: json['updated_at'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    data['User_id'] = userid;
    data['EXD'] = exd;
    data['Content'] = content;
    data['EXD'] = quantity;
    data['Status'] = status;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}
