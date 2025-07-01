class ThreadModel {
  String? createdAt;
  String? id;
  int? likeCount;
  String? title;
  String? userId;
  String? nickname;

 ThreadModel(
      {this.createdAt, this.id, this.likeCount, this.title, this.userId});

 ThreadModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    likeCount = json['like_count'];
    title = json['title'];
    userId = json['user_id'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['id'] = id;
    data['like_count'] = likeCount;
    data['title'] = title;
    data['user_id'] = userId;
    data['nickname'] = nickname;
    return data;
  }
}
