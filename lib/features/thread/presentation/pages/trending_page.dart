import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/thread/presentation/controllers/trending_controller.dart';
import 'package:pengen_chat/features/thread/presentation/widget/thread_list_widget.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  final TrendingController trendingController = Get.put(TrendingController());

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
          _buildCreateThreadSection(),
          Expanded(
            child: ThreadListWidget(threads: trendingController.trendings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          trendingController.openNewThreadForm();
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCreateThreadSection() {
    return InkWell(
      onTap: () => trendingController.openNewThreadForm(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person, size: 24, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama Saya"),
                      const SizedBox(height: 2),
                      Text(
                        "Bikin threads Yukk !!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(height: 0.3, color: Colors.grey.withOpacity(0.5)),
        ],
      ),
    );
  }
}
