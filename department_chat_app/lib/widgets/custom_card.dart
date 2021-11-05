import 'package:department_chat_app/model/chat_model.dart';
import 'package:department_chat_app/screens/Pages/group_chat_page.dart';
import 'package:department_chat_app/screens/Pages/person_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => chatModel.isGroup
                ? GroupChatPage()
                : PersonChatPage(
                    chatModel: chatModel,
                  ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                chatModel.isGroup ? Icons.groups : Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              chatModel.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  size: 13,
                ),
                const SizedBox(width: 2),
                Text(
                  chatModel.currentMessage ?? '',
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chatModel.time ?? ''),
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
