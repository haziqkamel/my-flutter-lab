import 'package:department_chat_app/model/chat_model.dart';
import 'package:department_chat_app/screens/Pages/create_group.dart';
import 'package:department_chat_app/widgets/button_card.dart';
import 'package:department_chat_app/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    //
    List<ChatModel> contacts = [
      ChatModel(
        name: 'Haziq Kamel',
        status: 'A full stack developer',
        isGroup: false,
      ),
      ChatModel(
        name: 'G G',
        status: 'A full stack developer ??',
        isGroup: true,
      ),
      ChatModel(
        name: 'Your Name',
        status: 'A full stack what?',
        isGroup: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Select Contact',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              '25 Contacts',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Invite a friend'),
                value: 'Invite a friend',
              ),
              const PopupMenuItem(
                child: Text('Contacts'),
                value: 'Contacts',
              ),
              const PopupMenuItem(
                child: Text('Refresh'),
                value: 'Refresh',
              ),
              const PopupMenuItem(
                child: Text('Help'),
                value: 'Help',
              ),
            ];
          }),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, i) {
          if (i == 0) {
            return InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateGroup())),
              child: const ButtonCard(
                icon: Icons.group,
                name: 'New Group',
              ),
            );
          } else if (i == 1) {
            return const ButtonCard(
              icon: Icons.person,
              name: 'New Contact',
            );
          }
          return ContactCard(contact: contacts[i - 2]);
        },
      ),
    );
  }
}
