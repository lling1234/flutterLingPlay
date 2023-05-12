import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingplay/dart/core/getx/base_get_state.dart';

class LoginState extends BaseGetState {
  var account = "".obs; // 定义响应式变量
  var passWord = "".obs; // 定义响应式变量

  var accountLogin = true.obs;

  var phoneNumberLogin = false.obs;

  TextEditingController accountController = TextEditingController(text: "");

  TextEditingController passWordController = TextEditingController(text: "");

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController verifyController = TextEditingController();
}
