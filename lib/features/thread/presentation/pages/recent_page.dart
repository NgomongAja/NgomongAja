import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/thread/presentation/controllers/recent_controller.dart';
import 'package:pengen_chat/features/thread/presentation/widget/thread_list_widget.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => RecentPageState();
}

class RecentPageState extends State<RecentPage> {
  final RecentController recentController = Get.put(RecentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: kToolbarHeight * 0.5,
      ),
      body: Column(
        children: [
          // _buildCreateThreadSection(),
          Expanded(child: ThreadListWidget(threads: recentController.recents)),
        ],
      ),
    );
  }
}
