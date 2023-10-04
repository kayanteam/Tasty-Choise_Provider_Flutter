import 'package:tasty_choise_provider/future/home/models/ad.dart';
import 'package:tasty_choise_provider/future/home/models/product.dart';

class HomeResponse {
  List<Ad>? ads;
  List<Product>? prodtucts;

  HomeResponse({this.ads, this.prodtucts});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = <Ad>[];
      json['ads'].forEach((v) {
        ads!.add(new Ad.fromJson(v));
      });
    }
    if (json['prodtucts'] != null) {
      prodtucts = <Product>[];
      json['prodtucts'].forEach((v) {
        prodtucts!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ads != null) {
      data['ads'] = this.ads!.map((v) => v.toJson()).toList();
    }
    if (this.prodtucts != null) {
      data['prodtucts'] = this.prodtucts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
