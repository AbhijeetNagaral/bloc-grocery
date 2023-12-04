
class ProductDetailsModel {
  String? id;
  String? name;
  String? description;
  double? price;
  String? imageUrl;

  ProductDetailsModel(
      {this.id, this.name, this.description, this.price, this.imageUrl});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    price = json['price'] ?? 0;
    imageUrl = json['imageUrl'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}