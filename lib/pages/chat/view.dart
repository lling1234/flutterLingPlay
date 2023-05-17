import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lingplay/router.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          GFButton(
            onPressed: () {
              Get.toNamed(Routers.chatScreen);
            },
            text: "GPT3.5",
            icon: Icon(Icons.facebook),
          ),
        ],
      ),
    );
  }
}
