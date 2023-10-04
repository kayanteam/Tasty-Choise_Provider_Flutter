import 'package:tasty_choise_provider/core/network/home_api.dart';
import 'package:tasty_choise_provider/future/home/domin/home_repo.dart';
import 'package:tasty_choise_provider/future/home/models/app.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';
import 'package:tasty_choise_provider/future/home/models/home_response.dart';

class HomeRepoImp extends HomeRepo {
  final HomeApi api;

  HomeRepoImp({required this.api});

  @override
  EitherType<GeneralResponse<App>> appConfig() {
    return api.appConfig();
  }

  @override
  EitherType<GeneralResponse<HomeResponse>> homeData() {
    return api.getHomeData();
  }

  @override
  EitherType<GeneralResponse> storeProduct({
    required String name,
    required String price,
    required String? image,
    required String productTypeId,
    required String description,
    required int? productId,
  }) {
    return api.storeProduct(
        name: name,
        price: price,
        image: image,
        productTypeId: productTypeId,
        description: description,
        productId: productId);
  }

  @override
  EitherType<GeneralResponse> deleteProduct(int id) {
    return api.deleteProduct(id: id);
  }
}
