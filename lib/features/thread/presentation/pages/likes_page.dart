import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/thread/presentation/controllers/likes_controller.dart';
import 'package:pengen_chat/features/thread/presentation/widget/thread_list_widget.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => LikesPageState();
}

class LikesPageState extends State<LikesPage> {
  final LikesController likesController = Get.put(LikesController());

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
          Expanded(
            child: ThreadListWidget(threads: likesController.likedThreads),
          ),
        ],
      ),
    );
  }
}
