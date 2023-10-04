class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  int? restaurantId;
  int? productTypeId;
  String? createdAt;
  String? updatedAt;
  int? count;

  Product(
      {this.id,
      this.name,
      this.description,
      this.count,
      this.image,
      this.price,
      this.restaurantId,
      this.productTypeId,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    restaurantId = json['restaurant_id'];
    productTypeId = json['product_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['restaurant_id'] = this.restaurantId;
    data['product_type_id'] = this.productTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
