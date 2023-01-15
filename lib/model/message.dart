enum MessageType{
  receiver, // I receive this message
  sender // I send this message
}

class Message{
  final String text;
  final DateTime time;
  final MessageType msgType;

  Message({
    required this.text,
    required this.msgType,
    required this.time,
});
}