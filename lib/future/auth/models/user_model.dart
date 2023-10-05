class UserModel {
  int? id;
  String? name;
  String? image;
  String? phone;
  String? email;
  String? token;
  String? mangerName;
  bool? isSubscribed;

  UserModel(
      {this.id,
      this.name,
      this.image,
      this.phone,
      this.email,
      this.token,
      this.isSubscribed,
      this.mangerName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    mangerName = json['manger_name'];
    isSubscribed = json['is_subscribed'];
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
    data['is_subscribed'] = isSubscribed;

    return data;
  }
}
