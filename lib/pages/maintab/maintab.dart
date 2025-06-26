import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/pages/likes/likes_page.dart';
import 'package:pengen_chat/pages/maintab/controller/maintab_controller.dart';
import 'package:pengen_chat/pages/message/message_page.dart';
import 'package:pengen_chat/pages/recent/recent_page.dart';
import 'package:pengen_chat/pages/trending/presentation/trending_view.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(MainTabBarController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: kToolbarHeight * 0.5,
        bottom: TabBar(
          controller: tabController.tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: tabController.tabList.map((label) => Tab(text: label)).toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController.tabController,
        children: const [
          TrendingView(),
          RecentPage(),
          LikesPage(),
          MessagePage(),
        ],
      ),
    );
  }
}
