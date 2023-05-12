import 'dart:convert';

import 'package:get/get.dart';
import 'package:lingplay/config/constant.dart';
import 'package:lingplay/dart/core/getx/base_controller.dart';
import 'package:lingplay/model/model.dart';
import 'package:lingplay/pages/home/view.dart';
import 'package:lingplay/router.dart';
import 'package:lingplay/util/http_util.dart';
import 'package:permission_handler/permission_handler.dart';

import 'state.dart';

class LoginController extends BaseController<LoginState> {
  final LoginState state = LoginState();

  @override
  void onInit() async {
    state.accountController.text = "";
    state.phoneNumberController.text = "";
    state.passWordController.text = "";
  }

  void login() async {
    print("login logic");
    print(state.accountController.value.text);
    print(state.passWordController.value.text);

    Get.toNamed(Routers.home);

    // dynamic accountPwd = {"account": "ling", "pwd": "Lling123!"};

    // final loginRsp = await HttpUtil()
    //     .post("${Constant.kernel}/login", accountPwd, data: accountPwd);
    // print("loginRsp");
    // print(loginRsp);
    // final result = ResultType.fromJson(loginRsp);
  }
}
