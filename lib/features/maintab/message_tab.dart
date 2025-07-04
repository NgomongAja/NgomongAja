import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/maintab/controller/messagetab_controller.dart';
import 'package:pengen_chat/features/message/presentation/pages/chat_room_group_page.dart';
import 'package:pengen_chat/features/message/presentation/pages/chat_room_page.dart';

class MessageTab extends StatelessWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(MessagetabController());

    return Column(
      children: [
        TabBar(
          controller: tabController.tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: tabController.tabList.map((label) => Tab(text: label)).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController.tabController,
            children: [ChatRoomPage(), ChatRoomGroupPage()],
          ),
        ),
      ],
    );
  }
}
