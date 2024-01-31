
class ChatUser {
  late String image;
  late String name;
  late String id;
  late String pushToken;

  ChatUser({
    required this.image,
    required this.name,
    required this.id,
    required this.pushToken,
  });

  ChatUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    id = json['id'] ?? '';
    pushToken = json['push_token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['id'] = id;
    data['push_token'] = pushToken;
    return data;
  }
}