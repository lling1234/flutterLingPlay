import 'package:get/get.dart';
import 'package:lingplay/dart/core/getx/base_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import 'state.dart';

class LoginController extends BaseController<LoginState> {
  final LoginState state = LoginState();

  @override
  void onInit() async {
    state.accountController.text = "";
    state.phoneNumberController.text = "";
    state.passWordController.text = "";
    state.account = "111".obs;
    state.passWord = "222".obs;
  }

  void login() async {
    print("login logic");
    print(state.accountController.value.text);
    print(state.account);
    print(state.passWord);
  }
}
