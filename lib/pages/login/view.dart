import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingplay/dart/core/getx/base_get_view.dart';
import 'package:lingplay/pages/login/logic.dart';
import 'package:lingplay/pages/login/state.dart';

class LoginPage extends BaseGetView<LoginController, LoginState> {
  @override
  Widget buildView() {
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
                controller: state.accountController,
                decoration: InputDecoration(
                  labelText: '账号',
                ),
              ),

              TextFormField(
                controller: state.passWordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '密码',
                ),
              ),
              // 密码输入框
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: Text('注册'),
                  ),
                  SizedBox(width: 60.0),
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: Text('登录'),
                  ),
                ],
              ),

              // 忘记密码按钮
              TextButton(
                onPressed: () {},
                child: Text('忘记密码？'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 同意用户协议复选框
                  Checkbox(
                      value: true, onChanged: (bool? value) => {print(11)}),
                  Text('我同意'),
                  // 用户协议链接
                  TextButton(
                    onPressed: () {},
                    child: Text('用户协议'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
