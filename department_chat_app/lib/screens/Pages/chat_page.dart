import 'package:department_chat_app/model/chat_model.dart';
import 'package:department_chat_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatModel> _chats = [
    ChatModel(
      name: 'Haziq Kamel',
      icon: const Icon(Icons.person),
      isGroup: false,
      time: '12:00 AM',
      currentMessage: 'Hi There!',
    ),
    ChatModel(
      name: 'Haziq\'s Group',
      icon: const Icon(Icons.groups),
      isGroup: true,
      time: '12:00 AM',
      currentMessage: 'Hi Everyone!',
    ),
    ChatModel(
      name: 'No one',
      icon: const Icon(Icons.person),
      isGroup: false,
      time: '12:00 AM',
      currentMessage: 'Hi There!',
    ),
    ChatModel(
      name: 'No 2',
      icon: const Icon(Icons.person),
      isGroup: false,
      time: '12:00 AM',
      currentMessage: 'Hi There!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: _chats.length,
          itemBuilder: (ctx, i) => CustomCard(chatModel: _chats[i]),
        ));
  }
}
