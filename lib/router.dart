import 'package:get/get_navigation/src/routes/get_route.dart';

import 'pages/login/binding.dart';
import 'pages/login/view.dart';

class Routers {
  // 登录
  static const String login = "/login";

  static List<GetPage> getInitRouters() {
    return [
      GetPage(
        name: Routers.login,
        page: () => LoginPage(),
        binding: LoginBinding(),
      )
    ];
  }
}
