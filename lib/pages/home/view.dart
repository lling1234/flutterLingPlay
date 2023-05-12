import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingplay/dart/core/getx/base_get_view.dart';
import 'package:lingplay/event/home_data.dart';
import 'package:lingplay/pages/chat/view.dart';
import 'package:lingplay/pages/login/logic.dart';
import 'package:lingplay/pages/login/state.dart';
import 'package:lingplay/pages/setting/view.dart';
import 'package:lingplay/pages/shop/view.dart';
import 'package:lingplay/pages/work/view.dart';
import 'package:lingplay/util/event_bus_helper.dart';
import 'package:lingplay/util/sys_util.dart';
import 'package:lingplay/util/toast_utils.dart';
import 'package:lingplay/widget/loading_dialog.dart';
import 'package:lingplay/widget/template/lingplay_scaffold.dart';
import 'package:lingplay/widget/template/lingplay_scaffold2.dart';
import 'package:lingplay/widget/template/tabs.dart';

DateTime? _lastCloseApp;

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SysUtil.setStatusBarBright();
    return WillPopScope(
      onWillPop: () async {
        if (_lastCloseApp == null ||
            DateTime.now().difference(_lastCloseApp!) >
                const Duration(seconds: 1)) {
          _lastCloseApp = DateTime.now();
          ToastUtils.showMsg(msg: '再按一次退出');
          return false;
        }
        return true;
      },
      child: LingPlayScaffold2(
        resizeToAvoidBottomInset: false,
        appBarElevation: 0,
        appBarHeight: 0,
        body: SafeArea(
          child: Tabs(
            tabCtrl: controller.tabController,
            views: controller.tabs.map((e) => e.toTabView()).toList(),
            bottom: TabBar(
              controller: controller.tabController,
              tabs: controller.tabs.map((item) => item.toTab()).toList(),
              onTap: (index) {},
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends TabsController {
  @override
  initTabs() {
    // var size = Size(32.w, 32.w);
    registerTab(
      XTab(
          view: HomePage(),
          tab: Container(
            child: Text("home"),
          )),
    );
    registerTab(
      XTab(
          view: ChatPage(),
          tab: Container(
            child: Text("ChatPage"),
          )),
    );
    registerTab(
      XTab(
          view: WorkPage(),
          tab: Container(
            child: Text("WorkPage"),
          )),
    );
    registerTab(
      XTab(
          view: ShopPage(),
          tab: Container(
            child: Text("ShopPage"),
          )),
    );
    registerTab(
      XTab(
          view: SettingPage(),
          tab: Container(
            child: Text("SettingPage"),
          )),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    EventBusHelper.register(this, (event) async {
      if (event is ShowLoading) {
        if (event.isShow) {
          LoadingDialog.showLoading(Get.context!, msg: "加载数据中");
        } else {
          LoadingDialog.dismiss(Get.context!);
        }
      }
    });
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    // _update();
  }

  // _update() async {
  //   // 获取当前 apk 版本
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String version = packageInfo.version;

  //   // 弹出更新框
  //   var versionEntry = await updateCtrl.versionList();
  //   if (versionEntry != null && (versionEntry.versionMes ?? []).isNotEmpty) {
  //     //筛选出当前最新版本
  //     PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //     String appName = packageInfo.appName;
  //     int versionCode = int.parse(packageInfo.buildNumber);
  //     debugPrint("appName:$appName version:$version versionCode:$versionCode");
  //     for (VersionVersionMes element in (versionEntry.versionMes ?? [])) {
  //       if (appName == element.appName) {
  //         if (element.version! > versionCode) {
  //           //有新版本弹框提示
  //           showAnimatedDialog(
  //             context: navigatorKey.currentContext!,
  //             barrierDismissible: true,
  //             animationType: DialogTransitionType.fadeScale,
  //             builder: (BuildContext context) {
  //               return UpdaterDialog(
  //                 icon: element.uploadName?.shareLink ?? '',
  //                 version: "${element.version}",
  //                 path: element.shareLink ?? '',
  //                 content: element.remark ?? '',
  //               );
  //             },
  //           );
  //           break;
  //         }
  //       }
  //     }
  //   }
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    EventBusHelper.unregister(this);
  }
}
