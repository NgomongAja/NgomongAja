import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pengen_chat/features/message/presentation/controllers/chat_room_controller_ex.dart';
import 'package:pengen_chat/features/message/presentation/widget/chat_room_widget.dart';

class ChatRoomGroupPage extends StatefulWidget {
  const ChatRoomGroupPage({super.key});

  @override
  State<ChatRoomGroupPage> createState() => _ChatRoomGroupPageState();
}

class _ChatRoomGroupPageState extends State<ChatRoomGroupPage> {
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
