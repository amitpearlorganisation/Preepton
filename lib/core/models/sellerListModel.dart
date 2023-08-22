class SellerList {
  List<Sellers>? _sellers;
  bool? _status;

  SellerList({List<Sellers>? sellers, bool? status}) {
    if (sellers != null) {
      this._sellers = sellers;
    }
    if (status != null) {
      this._status = status;
    }
  }

  List<Sellers>? get sellers => _sellers;
  set sellers(List<Sellers>? sellers) => _sellers = sellers;
  bool? get status => _status;
  set status(bool? status) => _status = status;

  SellerList.fromJson(Map<String, dynamic> json) {
    if (json['sellers'] != null) {
      _sellers = <Sellers>[];
      json['sellers'].forEach((v) {
        _sellers!.add(new Sellers.fromJson(v));
      });
    }
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._sellers != null) {
      data['sellers'] = this._sellers!.map((v) => v.toJson()).toList();
    }
    data['status'] = this._status;
    return data;
  }
}

class Sellers {
  int? _id;
  String? _name;
  String? _email;
  String? _contactNo;
  String? _type;
  String? _address;
  Null? _emailVerifiedAt;
  Null? _profilePhoto;
  Null? _profilePath;
  String? _createdAt;
  String? _updatedAt;

  Sellers(
      {int? id,
        String? name,
        String? email,
        String? contactNo,
        String? type,
        String? address,
        Null? emailVerifiedAt,
        Null? profilePhoto,
        Null? profilePath,
        String? createdAt,
        String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (contactNo != null) {
      this._contactNo = contactNo;
    }
    if (type != null) {
      this._type = type;
    }
    if (address != null) {
      this._address = address;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (profilePhoto != null) {
      this._profilePhoto = profilePhoto;
    }
    if (profilePath != null) {
      this._profilePath = profilePath;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get contactNo => _contactNo;
  set contactNo(String? contactNo) => _contactNo = contactNo;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get address => _address;
  set address(String? address) => _address = address;
  Null? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(Null? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  Null? get profilePhoto => _profilePhoto;
  set profilePhoto(Null? profilePhoto) => _profilePhoto = profilePhoto;
  Null? get profilePath => _profilePath;
  set profilePath(Null? profilePath) => _profilePath = profilePath;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Sellers.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _contactNo = json['contact_no'];
    _type = json['type'];
    _address = json['address'];
    _emailVerifiedAt = json['email_verified_at'];
    _profilePhoto = json['profile_photo'];
    _profilePath = json['profile_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['contact_no'] = this._contactNo;
    data['type'] = this._type;
    data['address'] = this._address;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['profile_photo'] = this._profilePhoto;
    data['profile_path'] = this._profilePath;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}