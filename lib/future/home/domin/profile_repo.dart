import 'package:tasty_choise_provider/core/network/home_api.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

abstract class ProfileRepo {
  EitherType<GeneralResponse> appSettings(String value);

  EitherType<GeneralResponse?> getTransactions();
  EitherType<GeneralResponse?> requestMoney({
    required String name,
    required String ibanNumber,
    required String accountNumber,
    required String amount,
  });

  EitherType<GeneralResponse> subscribtions();
  EitherType<GeneralResponse> subscibe(int id);
}
