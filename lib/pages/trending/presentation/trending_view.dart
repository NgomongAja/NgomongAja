import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/common/utils/date_utils.dart';
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
      appBar: AppBar(title: const Text("Threads")),
      body: TrendingListWidget(presenter: presenter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          presenter.addNewThread();
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
