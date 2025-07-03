import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/thread/presentation/controllers/trending_controller.dart';

// ignore: must_be_immutable
class ThreadInputWidget extends StatelessWidget {
  TrendingController trendingController;
  ThreadInputWidget({super.key, required this.trendingController});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 16),
          height: MediaQuery.of(context).size.height - 150,
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 36),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "New Thread",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(hintText: "What's on your mind?"),
                onChanged: (value) =>
                    trendingController.threadInputValue.value = value,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: trendingController.threadInputValue.value.isEmpty
                    ? null
                    : () {
                        trendingController.createNewThread(
                          trendingController.threadInputValue.value,
                        );
                        trendingController.threadInputValue.value = "";
                      },
                child: Text("Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
