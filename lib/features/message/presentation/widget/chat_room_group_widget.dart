import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pengen_chat/features/message/domain/model/chat_room_model.dart';

class ChatRoomGroupWidget extends StatelessWidget {
  List<ChatRoomModel> ChatRoomList;
  ChatRoomGroupWidget({super.key, required this.ChatRoomList});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ChatRoomList.isEmpty) {
        return Center(child: Text("No Chat Room"));
      }

      return ListView.builder(
        itemCount: ChatRoomList.length,
        itemBuilder: (context, index) {
          final ChatRoom = ChatRoomList[index];
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
                              child: Row(children: [Text(ChatRoom.name ?? "")]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
