class Message {
  String message;
  String sentByMe;
  Message({
    required this.message,
    required this.sentByMe,
  });

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(
      message: map['message'],
      sentByMe: map['sentByMe'],
    );
  }

}
