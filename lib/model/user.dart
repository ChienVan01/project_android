class Profile {
  User? user;
  String tokenUser;

  Profile({this.user, required this.tokenUser});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        tokenUser: json['tokenUser'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  String? otp;
  int? userType_id;
  int status;
  String? createdAt;
  String? updatedAt;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.name,
      this.phone,
      this.address,
      this.avatar,
      this.otp,
      this.userType_id,
      required this.status,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['Email'],
        password: json['Password'],
        name: json['Name'],
        phone: json['Phone'],
        address: json['Address'],
        avatar: json['Avatar'],
        otp: json['otp'],
        userType_id: json['UserType_id'],
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Email'] = email;
    data['Password'] = password;
    data['Name'] = name;
    data['Phone'] = phone;
    data['Address'] = address;
    data['Avatar'] = avatar;
    data['otp'] = otp;
    data['UserType_id'] = userType_id;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserProfile {
  int id;
  String email;
  String password;
  String name;
  String? phone;
  String? address;
  String? avatar;
  String? otp;
  String? tokenUser;
  int status;

  UserProfile({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    this.phone,
    this.address,
    this.otp,
    this.avatar,
    this.tokenUser,
    required this.status,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        name: json['name'],
        phone: json['phone'],
        address: json['address'],
        otp: json['otp'],
        avatar: json['avatar'],
        tokenUser: json['tokenUser'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['avatar'] = avatar;
    data['otp'] = otp;
    data['tokenUser'] = tokenUser;
    data['status'] = status;

    return data;
  }
}
