import 'package:small_store_app/model/category_model.dart';

class ProductsModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoryModel? category;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  static List<ProductsModel> productSnapshots(List dataList) {
    return dataList.map((e) {
      return ProductsModel.fromJson(e);
    }).toList();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['price'] = price;
  //   data['description'] = description;
  //   data['images'] = images;
  //   data['creationAt'] = creationAt;
  //   data['updatedAt'] = updatedAt;
  //   if (category != null) {
  //     data['category'] = category!.toJson();
  //   }
  //   return data;
  // }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
