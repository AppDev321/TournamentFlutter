import 'dart:convert';
import 'dart:io';

import 'package:base_project_getx/data/models/auth/login_reponse.dart';
import 'package:base_project_getx/data/models/auth/login_response_model.dart';
import 'package:base_project_getx/data/models/auth/register_response_model.dart';
import 'package:base_project_getx/data/network/constants/endpoints.dart';
import 'package:base_project_getx/data/network/dio_client.dart';
import 'package:base_project_getx/data/network/response/result_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../exceptions/network_exceptions.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  AuthApi(this._dioClient);

  Future<dynamic> postRequest(
      String endPoint,{required Map<String, dynamic> queryParams}) async {
    final res = await _dioClient.post(
      endPoint,
      queryParameters: queryParams,
    ).catchError((err){
      print("error is here  == ${err.runtimeType}");
    });
   // print("response is here  == $res");
return "";
    /*  if(res is String) {
        print("erero  == $res");
        return ApiResponse.error(res);
      }
      else
        {
          return ApiResponse.completed(res);
        }*/


}
  Future<RegisterResponseModel> registerRequest(
      {required String email, required String password}) async {
    try {
      final res = await _dioClient.post(
        Endpoints.login,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        queryParameters: <String, String>{'username': email, 'password': password},
        /*data:
            jsonEncode(<String, String>{'email': email, 'password': password}),*/
      );
      return RegisterResponseModel.fromJson(res.data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }


  }

  Future logoutRequest() async {
    try {
      final res = await _dioClient.post(Endpoints.logout);
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future forgotPasswordRequest({required String email}) async {
    try {
      final res = await _dioClient.post(
        Endpoints.forgotPassword,
        data: jsonEncode(
          <String, String>{'email': email},
        ),
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> resetPasswordRequest(
      {required String oldPassword, required String newPassword}) async {
    try {
      final res = await _dioClient.post(
        Endpoints.resetPassword,
        data: jsonEncode(
          <String, String>{
            'old_password': oldPassword,
            'new_password': newPassword,
          },
        ),
      );
      return res;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
