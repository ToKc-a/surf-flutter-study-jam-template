import 'package:flutter/material.dart';
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

  final _userNameController = TextEditingController();
  final _messageController = TextEditingController();

  @override

  void dispose(){
    _userNameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: _userNameController,
          style: TextStyle(color: Colors.white),
          autofocus: true,
          decoration: InputDecoration(
              labelText: 'Введите ник',
              labelStyle: TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                onPressed: () {
                  uodateChat();
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              )),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextFormField(
          controller: _messageController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            labelText: 'Сообщение',
            suffixIcon: GestureDetector(
              onTap: () {
                sendMessage();
              },
              child: Icon(
                Icons.send,
              ),
            ),
          ),
        ),
      ),
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
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void sendMessage() async {
    widget.chatRepository.sendMessage(_userNameController.text, _messageController.text);
    uodateChat();
    _messageController.clear();
  }

  void uodateChat() async {
    setState(() {
      widget.chatRepository.messages;
    });
  }
}
