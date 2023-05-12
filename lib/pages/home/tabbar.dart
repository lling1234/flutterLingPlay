import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({ Key? key }) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text('我的 TabBar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab1'),
            Tab(text: 'Tab2'),
            Tab(text: 'Tab3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('这是第一个 Tab')),
          Center(child: Text('这是第二个 Tab')),
          Center(child: Text('这是第三个 Tab')),
        ],
      ),
    );
  }
}
