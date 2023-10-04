import 'package:tasty_choise_provider/core/network/home_api.dart';
import 'package:tasty_choise_provider/future/auth/models/general_auth_response.dart';
import 'package:tasty_choise_provider/future/auth/models/user_model.dart';
import 'package:tasty_choise_provider/future/home/models/general_response.dart';

abstract class AuthRepo {
  EitherType<GeneralAuthResponse<UserModel>> login({
    required String email,
    required String password,
  });

  EitherType<GeneralAuthResponse<UserModel>> register({
    required String email,
    required String admin,
    required int categoryId,
    required String name,
    required String password,
  });

  EitherType<GeneralAuthResponse<UserModel>> verifyCode({
    required String email,
    required String code,
  });

  EitherType<GeneralAuthResponse<void>> forgetPassword({
    required String email,
  });

  EitherType<GeneralAuthResponse<void>> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  EitherType<GeneralAuthResponse<void>> changePassword({
    required String currentPass,
    required String newPass,
    required String confirmPass,
  });

  EitherType<GeneralResponse> updateProfileData(
      {required UserModel user, required int categoryId});
}
