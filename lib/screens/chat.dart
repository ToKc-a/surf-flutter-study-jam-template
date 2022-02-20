import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/app_bars.dart';
import 'package:surf_practice_chat_flutter/chat_message.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

/// Chat screen templete. This is your starting point.
class ChatScreen extends StatefulWidget {
  final ChatRepository chatRepository;

  const ChatScreen({
    Key? key,
    required this.chatRepository,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(),
      bottomNavigationBar: chatBottomAppBar(),
      body: FutureBuilder<List>(
        future: widget.chatRepository.messages,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                reverse: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatMessage(data: snapshot.data?[index]);
                });
          } else if (snapshot.hasError){
            return Text('${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}