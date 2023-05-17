import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'router.dart';

void main() {
  // 逻辑绑定
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '登录页面',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routers.login,
      getPages: Routers.getInitRouters(),
      // home: LoginPage(),
    );
  }
}
