import 'package:lingplay/dart/core/getx/base_bindings.dart';
import 'package:lingplay/pages/login/logic.dart';

class LoginBinding extends BaseBindings<LoginController> {
  @override
  LoginController getController() {
    return LoginController();
  }
}
