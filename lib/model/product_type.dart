class ProductType {
  int id;
  String name;
  int? parentId;
  int status;
  String? createdAt;
  String? updatedAt;

  ProductType({
    required this.id,
    required this.name,
    required this.parentId,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json['id'],
        name: json['Name'],
        parentId: json['Parent_id'],
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Name'] = name;
    data['Parent_id'] = parentId;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
