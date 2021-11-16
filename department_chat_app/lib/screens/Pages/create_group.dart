import 'package:department_chat_app/model/chat_model.dart';
import 'package:department_chat_app/widgets/avatar_card.dart';
import 'package:department_chat_app/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              'Add Participants',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) {
                return Container(height: groups.isNotEmpty ? 90 : 10);
              }
              return InkWell(
                  onTap: () {
                    if (contacts[i - 1].select == false) {
                      setState(() {
                        contacts[i - 1].select = true;
                        groups.add(contacts[i - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[i - 1].select = false;
                        groups.remove(contacts[i - 1]);
                      });
                    }
                  },
                  child: ContactCard(contact: contacts[i - 1]));
            },
          ),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          itemCount: contacts.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            if (contacts[i].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contacts[i]);
                                    contacts[i].select = false;
                                  });
                                },
                                child: AvatarCard(
                                  contact: contacts[i],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    const Divider(thickness: 1),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
