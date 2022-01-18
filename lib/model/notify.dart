class Notify {
  int id;
  String name;
  int userid;
  String receiveddate;
  String content;
  int status;
  String? createdat;
  String? updatedat;

  Notify(
      {required this.id,
      required this.name,
      required this.userid,
      required this.receiveddate,
      required this.content,
      required this.status,
      this.createdat,
      this.updatedat});
  factory Notify.fromJson(Map<String, dynamic> json) => Notify(
        id: json['id'],
        name: json['Name'],
        userid: json['User_id'],
        receiveddate: json['ReceivedDate'],
        content: json['Content'],
        status: json['Status'],
        createdat: json['created_at'],
        updatedat: json['updated_at'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    data['User_id'] = userid;
    data['ReceivedDate'] = receiveddate;
    data['Content'] = content;
    data['Status'] = status;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}
