import 'package:department_chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';

class PersonChatPage extends StatefulWidget {
  PersonChatPage({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  final ChatModel chatModel;

  @override
  _PersonChatPageState createState() => _PersonChatPageState();
}

class _PersonChatPageState extends State<PersonChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 75,
        titleSpacing: 5,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 24,
              ),
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(
                widget.chatModel.isGroup ? Icons.groups : Icons.person,
                color: Colors.white,
              ),
            )
          ],
        ),
        title: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Last seen today at 12:00 AM',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        actions: [
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('View Contact'),
                value: 'View Contact',
              ),
              const PopupMenuItem(
                child: Text('Media, Links and Docs'),
                value: 'Media, Links and Docs',
              ),
              const PopupMenuItem(
                child: Text('WhatsApp Web'),
                value: 'WhatsApp Web',
              ),
              const PopupMenuItem(
                child: Text('Search'),
                value: 'Search',
              ),
              const PopupMenuItem(
                child: Text('Mute Notification'),
                value: 'Mute Notification',
              ),
              const PopupMenuItem(
                child: Text('Wallpaper'),
                value: 'Wallpaper',
              ),
            ];
          }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 55,
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(5),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.attach_file,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          hintText: 'Type a message..',
                          hintStyle: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF128C7E),
                      radius: 25,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
