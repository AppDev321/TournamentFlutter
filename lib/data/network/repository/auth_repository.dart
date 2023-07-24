import 'package:base_project_getx/data/models/auth/login_reponse.dart';
import 'package:base_project_getx/data/models/auth/login_response_model.dart';
import 'package:base_project_getx/data/models/auth/register_response_model.dart';
import 'package:base_project_getx/data/network/apis/auth/auth_api.dart';
import 'package:base_project_getx/data/network/constants/endpoints.dart';

import '../response/api_status.dart';
import '../response/result_handler.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<ApiResponse> loginRequest(String email, String password) async {
    return authApi
        .postRequest(Endpoints.login,queryParams:{'username': email, 'password': password}).then((value){
        return ApiResponse.error(value.message);
      });


    /*  print("result - $res");

        if(res.status == Status.ERROR)
      {
        return ApiResponse.error(res.message);
      }
      else
      {
        return ApiResponse.completed(res.data);
      }*/
  }

  Future<RegisterResponseModel> registerRequest(
      String email, String password) async {
    return await authApi
        .registerRequest(email: email, password: password)
        .then((registerResponse) {
      return registerResponse;
    }).catchError((error) => throw error);
  }

  Future logoutRequest() async {
    return await authApi.logoutRequest().then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  Future forgotPassword({required String email}) async {
    return await authApi.forgotPasswordRequest(email: email).then(
      (res) {
        return res;
      },
    ).catchError(
      (error) => throw error,
    );
  }

  Future resetPassword(
      {required String oldPassword, required String newPassword}) async {
    return await authApi
        .resetPasswordRequest(
      newPassword: newPassword,
      oldPassword: oldPassword,
    )
        .then(
      (res) {
        return res;
      },
    ).catchError(
      (error) => throw error,
    );
  }
}
