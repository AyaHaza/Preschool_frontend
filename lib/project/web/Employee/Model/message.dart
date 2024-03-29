class Message {
  Message({
    required this.toId,
    required this.msg,
    required this.type,
    required this.sent,
    required this.fromId,
    required this.fromName
  });

  late final String toId;
  late final String msg;
  late final String fromId;
  late final String fromName;
  late final Type type;
  late final String sent;

  Message.fromJson(Map<String, dynamic> json) {
    toId = json['toId'].toString();
    msg = json['msg'].toString();
    type = json['type'].toString() == Type.image.name ? Type.image : Type.text;
    fromId = json['fromId'].toString();
    sent = json['sent'].toString();
    fromName= json['fromName'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['toId'] = toId;
    data['msg'] = msg;
    data['type'] = type.name;
    data['fromId'] = fromId;
    data['sent'] = sent;
    data['fromName']=fromName;
    return data;
  }
}

enum Type { text, image }