import 'package:tasty_choise_provider/future/home/models/profile/wallet/wallet_object.dart';

class WalletResponse {
  bool? status;
  int? code;
  String? message;
  WalletObject? data;

  WalletResponse({
    this.status,
    this.code,
    this.message,
  });

  WalletResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];

    data = json['data'] != null ? WalletObject.fromJson(json['data']) : null;
  }
}
