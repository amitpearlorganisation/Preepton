class ProductList {
  List<Products>? products;
  bool? status;

  ProductList({this.products, this.status});

  ProductList.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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