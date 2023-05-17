import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lingplay/pages/chat/chat_screen.dart';
import 'package:lingplay/pages/chat/view.dart';
import 'package:lingplay/pages/home/view.dart';
import 'package:lingplay/pages/setting/view.dart';
import 'package:lingplay/pages/shop/view.dart';
import 'package:lingplay/pages/work/view.dart';

import 'pages/home/appbar.dart';
import 'pages/home/tabbar.dart';
import 'pages/login/binding.dart';
import 'pages/login/view.dart';

class Routers {
  // 登录
  static const String login = "/login";
  static const String home = "/home";
  static const String chat = "/chat";
  static const String chatScreen = "/chatScreen";
  static const String setting = "/setting";
  static const String shop = "/shop";
  static const String work = "/work";

  static List<GetPage> getInitRouters() {
    return [
      GetPage(
        name: Routers.login,
        page: () => LoginPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: Routers.home,
        page: () => HomePage2(),
        binding: Home2Binding(),
      ),
      GetPage(
        name: Routers.chat,
        page: () => ChatPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: Routers.chatScreen,
        page: () => ChatScreen(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: Routers.setting,
        page: () => SettingPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: Routers.shop,
        page: () => ShopPage(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: Routers.work,
        page: () => WorkPage(),
        binding: LoginBinding(),
      )
    ];
  }
}
