import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasty_choise_provider/core/network/end_points.dart';
import 'package:tasty_choise_provider/core/network/home_api.dart';
import 'package:tasty_choise_provider/core/services/dio_service.dart';
import 'package:tasty_choise_provider/core/utils/app_helpers.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

class OrderApi {
  final DioService dio;

  OrderApi({required this.dio});

  EitherType<GeneralResponse> orders(String status) async {
    try {
      final response = await dio.dio.get(
        EndPoints.ORDER + status,
        options: Options(headers: AppHelpers.getHeader()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }

  EitherType<GeneralResponse> updateOrder({
    required String status,
    required int orderId,
  }) async {
    try {
      final response = await dio.dio.post(
        EndPoints.ORDER_STATUS,
        data: {
          "status": status,
          "order_id": orderId,
        },
        options: Options(headers: AppHelpers.getHeader()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }
}
