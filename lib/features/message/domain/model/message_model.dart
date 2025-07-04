class MessageModel {
  String? id;
  String? roomId;
  String? senderId;
  String? content;
  String? sentAt;

  MessageModel({
    this.id,
    this.roomId,
    this.senderId,
    this.content,
    this.sentAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    senderId = json['sender_id'];
    content = json['content'];
    sentAt = json['sent_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['room_id'] = roomId;
    data['sender_id'] = senderId;
    data['content'] = content;
    data['sent_at'] = sentAt;
    return data;
  }
}
