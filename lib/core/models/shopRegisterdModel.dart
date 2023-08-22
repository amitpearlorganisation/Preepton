class ShopRegisteredModel {
  String? message;
  bool? status;

  ShopRegisteredModel({this.message, this.status});

  ShopRegisteredModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}