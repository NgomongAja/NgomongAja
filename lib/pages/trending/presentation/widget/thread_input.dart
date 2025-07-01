import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/pages/trending/presentation/trending_presenter.dart';

// ignore: must_be_immutable
class ThreadInput extends StatelessWidget {
  TrendingPresenter trendingPresenter;
  ThreadInput({super.key, required this.trendingPresenter});

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
                    trendingPresenter.threadInputValue.value = value,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: trendingPresenter.threadInputValue.value.isEmpty
                    ? null
                    : () {
                        trendingPresenter.createNewThread(
                          trendingPresenter.threadInputValue.value,
                        );
                        trendingPresenter.threadInputValue.value = "";
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
