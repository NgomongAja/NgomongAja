import 'dart:convert';

import 'package:get/get.dart';
import 'package:pengen_chat/features/message/domain/model/chat_room_model.dart';

class ChatRoomControllerEx extends GetxController {
  final ChatRoomList = <ChatRoomModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchChatRoom();
  }

  void fetchChatRoom() {
    final List<Map<String, dynamic>> hardcodedChatRooms = [
      {
        'id': '10000000-0000-0000-0000-000000000000',
        'type': 'one_to_one',
        'name': null, // Name can be null for one-to-one chats
        'creator_id': '00000000-0000-0000-0000-000000000001',
        // participant_ids is now a list
        'participant_ids': [
          '00000000-0000-0000-0000-000000000001',
          '00000000-0000-0000-0000-000000000002',
        ],
        'created_at': DateTime.now()
            .subtract(const Duration(hours: 9))
            .toIso8601String(),
      },
      {
        'id': '10000000-0000-0000-0000-000000000001',
        'type': 'group',
        'name': 'Gen Z Cuan Squad',
        'creator_id': '00000000-0000-0000-0000-000000000001',
        'participant_ids': [
          '00000000-0000-0000-0000-000000000001',
          '00000000-0000-0000-0000-000000000003',
          '00000000-0000-0000-0000-000000000004',
        ],
        'created_at': DateTime.now()
            .subtract(const Duration(days: 1))
            .toIso8601String(),
      },
    ];

    ChatRoomList.value = hardcodedChatRooms
        .map((json) => ChatRoomModel.fromJson(json))
        .toList();
  }
}
