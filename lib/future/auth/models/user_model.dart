class UserModel {
  int? id;
  String? name;
  String? image;
  String? phone;
  String? email;
  String? token;
  String? mangerName;

  UserModel(
      {this.id,
      this.name,
      this.image,
      this.phone,
      this.email,
      this.token,
      this.mangerName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    mangerName = json['manger_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['phone'] = phone;
    data['email'] = email;
    data['token'] = token;
    data['manger_name'] = mangerName;
    return data;
  }
}
