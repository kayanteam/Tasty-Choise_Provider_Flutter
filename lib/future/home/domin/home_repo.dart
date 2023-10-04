import 'package:tasty_choise_provider/core/network/home_api.dart';
import 'package:tasty_choise_provider/future/home/models/app.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';
import 'package:tasty_choise_provider/future/home/models/home_response.dart';

abstract class HomeRepo {
  EitherType<GeneralResponse<App>> appConfig();
  EitherType<GeneralResponse<HomeResponse>> homeData();
  EitherType<GeneralResponse> storeProduct({
    required String name,
    required String price,
    required String? image,
    required String productTypeId,
    required String description,
    required int? productId,
  });

  EitherType<GeneralResponse> deleteProduct(int id);
}
