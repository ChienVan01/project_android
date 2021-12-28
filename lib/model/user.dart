

class Profile {
  User? user;
  String tokenUser;

  Profile({ this.user, required this.tokenUser});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    user : json['user'] != null ?  User.fromJson(json['user']) : null,
    tokenUser : json['tokenUser'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['tokenUser'] = tokenUser;
    return data;
  }
}

class User {
  int id;
  String email;
  String password;
  String name;
  String? phone;
  String? address;
  String? avatar;
  int? userTypeId;
  int status;
  String? createdAt;
  String? updatedAt;

  User({
     required this.id,
     required this.email,
     required this.password,
     required this.name,
     this.phone,
      this.address,
      this.avatar,
      this.userTypeId,
     required this.status,
      this.createdAt,
      this.updatedAt
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id : json['id'],
    email : json['Email'],
    password : json['Password'],
    name :json['Name'],
    phone : json['Phone'],
    address: json['Address'],
    avatar : json['Avatar'],
    userTypeId : json['UserType_id'],
    status: json['Status'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['Email'] = email;
    data['Password'] = password;
    data['Name'] = name;
    data['Phone'] = phone;
    data['Address'] = address;
    data['Avatar'] = avatar;
    data['UserType_id'] = userTypeId;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}