import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/message/presentation/controllers/chat_room_controller_ex.dart';
import 'package:pengen_chat/features/message/presentation/widget/chat_room_widget.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final ChatRoomControllerEx chatRoomControllerEx = Get.put(
    ChatRoomControllerEx(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: ChatRoomWidget(ChatRoomList: chatRoomControllerEx.ChatRoomList),
      ),
    );
  }
}
