import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/pages/trending/presentation/trending_presenter.dart';
import 'package:pengen_chat/pages/trending/presentation/widget/trending_list.dart';

class TrendingView extends StatefulWidget {
  const TrendingView({super.key});

  @override
  State<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends State<TrendingView> {
  final TrendingPresenter presenter = Get.put(TrendingPresenter());

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
          Expanded(child: TrendingListWidget(presenter: presenter)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          presenter.openNewThreadForm();
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCreateThreadSection() {
    return InkWell(
      onTap: () => presenter.addNewThread(),
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
