class Rating {
  int id;
  int rate;
  String? evaluate;
  int productId;
  int userId;
  int status;
  String? createdAt;
  String? updatedAt;
  // String email;
  // String password;
   String name;
  // String? phone;
  // String? address;
  // String? avatar;
  // String? userTypeID;
  // String? rememberToken;

  Rating({
    required this.id,
    required this.rate,
    this.evaluate,
    required this.productId,
    required this.userId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    // required this.email,
    // required this.password,
     required this.name,
    // this.phone,
    // this.address,
    // this.avatar,
    // this.userTypeID,
    // this.rememberToken
  });
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json['id'],
        rate: json['Rate'],
        evaluate: json['Evaluate'],
        productId: json['Product_id'],
        userId: json['User_id'],
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        // email: json['Email'],
        // password: json['Password'],
         name: json['Name'],
        // phone: json['Phone'],
        // address: json['Address'],
        // avatar: json['Avatar'],
        // userTypeID: json['UserType_id'],
        // rememberToken: json['Remember_token'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Rate'] = rate;
    data['Evaluate'] = evaluate;
    data['Product_id'] = productId;
    data['User_id'] = userId;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // data['Email'] = email;
    // data['Password'] = password;
     data['Name'] = name;
    // data['Phone'] = phone;
    // data['Address'] = address;
    // data['Avatar'] = avatar;
    // data['UserType_id'] = userTypeID;
    // data['rememberToken'] = rememberToken;
    return data;
  }
}
