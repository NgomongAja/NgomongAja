import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/common/utils/date_util.dart';
import 'package:pengen_chat/features/thread/domain/model/thread_model.dart';

// ignore: must_be_immutable
class ThreadListWidget extends StatelessWidget {
  List<ThreadModel> threads;
  ThreadListWidget({super.key, required this.threads});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (threads.isEmpty) {
        return const Center(child: Text("Belum ada thread bro 😴"));
      }

      return ListView.builder(
        itemCount: threads.length,
        itemBuilder: (context, index) {
          final thread = threads[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Row(
                    children: [
                      Icon(Icons.person, size: 24, color: Colors.black),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(thread.nickname ?? ""),
                                        SizedBox(width: 8),
                                        Text(
                                          DateUtil.timeAgoFromString(
                                            thread.createdAt ?? "",
                                          ),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),

                                  InkWell(
                                    onTap: () {
                                      print("More");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        4.0,
                                      ), // biar tetap bisa ditekan enak
                                      child: Icon(Icons.more_horiz, size: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(thread.title ?? ""),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    Text(thread.likeCount.toString()),
                                  ],
                                ),
                                SizedBox(width: 8),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    Text("0"),
                                  ],
                                ),
                              ],
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
        },
      );
    });
  }
}
