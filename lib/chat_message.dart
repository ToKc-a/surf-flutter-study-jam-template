import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.data}) : super(key: key);

  final ChatMessageDto data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(data.author.name[0]),
          backgroundColor: Colors.deepPurple,
        ),
        title: Text(data.author.name),
        subtitle: Text(data.message.toString()),
      ),
    );
  }
}
