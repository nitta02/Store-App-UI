class CategoryModel {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }


  
  static List<CategoryModel> categorySnapshots(List dataList) {
    return dataList.map((e) {
      return CategoryModel.fromJson(e);
    }).toList();
  }
}
