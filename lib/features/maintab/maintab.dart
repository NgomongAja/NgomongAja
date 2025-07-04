import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/maintab/message_tab.dart';
import 'package:pengen_chat/features/message/presentation/pages/chat_room_page.dart';
import 'package:pengen_chat/features/thread/presentation/pages/likes_page.dart';
import 'package:pengen_chat/features/maintab/controller/maintab_controller.dart';
import 'package:pengen_chat/features/message/message_page.dart';
import 'package:pengen_chat/features/thread/presentation/pages/recent_page.dart';
import 'package:pengen_chat/features/thread/presentation/pages/trending_page.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(MainTabBarController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        toolbarHeight: kToolbarHeight * 0.5,
        bottom: TabBar(
          dividerHeight: 0,
          controller: tabController.tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: tabController.tabList.map((label) => Tab(text: label)).toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController.tabController,
        children: [TrendingPage(), RecentPage(), LikesPage(), MessageTab()],
      ),
    );
  }
}
