import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.data}) : super(key: key);

  final ChatMessageDto data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.author.toString()),
      subtitle: Text(data.message.toString()),
    );
  }
}
