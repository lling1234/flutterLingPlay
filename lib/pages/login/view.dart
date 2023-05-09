import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 账号输入框
              TextFormField(
                decoration: InputDecoration(
                  labelText: '账号',
                ),
              ),
              // 密码输入框
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '密码',
                ),
              ),
              SizedBox(height: 20.0),
              // 登录按钮
              ElevatedButton(
                onPressed: () {},
                child: Text('登录'),
              ),
              SizedBox(height: 10.0),
              // 忘记密码按钮
              TextButton(
                onPressed: () {},
                child: Text('忘记密码？'),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 同意用户协议复选框
                  Obx(
                    () => Checkbox(
                      value: loginController.isAgree.value,
                      onChanged: (bool? value) =>
                          loginController.toggleAgree(value ?? false),
                    ),
                  ),
                  Text('我同意'),
                  // 用户协议链接
                  TextButton(
                    onPressed: () {},
                    child: Text('用户协议'),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              // 注册按钮
              ElevatedButton(
                onPressed: () {},
                child: Text('注册'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
  RxBool isAgree = false.obs;

  toggleAgree(bool value) {
    isAgree.value = value;
  }
}
