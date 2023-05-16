import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingplay/pages/chat/view.dart';
import 'package:lingplay/pages/home/index/index.dart';
import 'package:lingplay/pages/setting/view.dart';
import 'package:lingplay/pages/shop/view.dart';
import 'package:lingplay/pages/work/view.dart';

class Home2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Home2Controller());
  }
}

class Home2Controller extends GetxController {
  final List<Widget> pages = [
    IndexPage(),
    ChatPage(),
    ShopPage(),
    WorkPage(),
    SettingPage()
  ];

  final List<String> titles = [
    '首页',
    '聊天',
    '市场',
    '待办',
    '我的',
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.chat,
    Icons.storefront,
    Icons.wallet,
    Icons.settings,
  ];

  final RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}

class HomePage2 extends GetView<Home2Controller> {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(controller.titles[controller.currentIndex.value]),automaticallyImplyLeading: false,),
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true, // 始终显示标签
        showUnselectedLabels: true, // 始终显示标签
        selectedLabelStyle: TextStyle(color: Colors.white), // 选中标签的样式
        unselectedLabelStyle: TextStyle(color: Colors.black), // 未选中标签的样式
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        items: List.generate(
          controller.icons.length,
          (index) => BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(controller.icons[index]),
            label: controller.titles[index],
          ),
        ),
      ),
    );
  }
}
