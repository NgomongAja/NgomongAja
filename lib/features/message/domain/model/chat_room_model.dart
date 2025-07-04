class ChatRoomModel {
  String? id;
  String? type;
  String? name;
  String? creatorId;
  String? participantId;
  String? createdAt;

  ChatRoomModel({
    this.id,
    this.type,
    this.name,
    this.creatorId,
    this.participantId,
    this.createdAt,
  });

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    creatorId = json['creator_id'];
    participantId = json['participant_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['creator_id'] = creatorId;
    data['participant_id'] = participantId;
    data['created_at'] = createdAt;
    return data;
  }
}
