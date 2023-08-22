class ProductViweList {
  Product? product;
  bool? status;

  ProductViweList({this.product, this.status});

  ProductViweList.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Product {
  int? id;
  int? sellerId;
  String? productName;
  String? description;
  String? image;
  String? price;
  String? stock;
  String? createdAt;
  String? updatedAt;
  String? productImage;

  Product(
      {this.id,
        this.sellerId,
        this.productName,
        this.description,
        this.image,
        this.price,
        this.stock,
        this.createdAt,
        this.updatedAt,
        this.productImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    productName = json['product_name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_image'] = this.productImage;
    return data;
  }
}