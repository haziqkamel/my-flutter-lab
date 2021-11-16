import 'dart:io';

import 'package:department_chat_app/model/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class PersonChatPage extends StatefulWidget {
  const PersonChatPage({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  final ChatModel chatModel;

  @override
  _PersonChatPageState createState() => _PersonChatPageState();
}

class _PersonChatPageState extends State<PersonChatPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    super.initState();
  }

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              focusNode: focusNode,
                              controller: _controller,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(5),
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      show = !show;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) =>
                                                bottomSheet());
                                      },
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
                    show
                        ? SizedBox(height: 250, child: emojiSelect())
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconBuilder(
                      icon: Icons.insert_drive_file,
                      bgColor: Colors.indigo,
                      text: 'Document'),
                  iconBuilder(
                      icon: Icons.camera_alt,
                      bgColor: Colors.pink,
                      text: 'Camera'),
                  iconBuilder(
                      icon: Icons.insert_photo,
                      bgColor: Colors.purple,
                      text: 'Gallery'),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconBuilder(
                      icon: Icons.headset,
                      bgColor: Colors.orange,
                      text: 'Audio'),
                  iconBuilder(
                      icon: Icons.location_pin,
                      bgColor: Colors.teal,
                      text: 'Location'),
                  iconBuilder(
                      icon: Icons.person,
                      bgColor: Colors.blue,
                      text: 'Contact'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconBuilder(
      {required IconData icon, required Color bgColor, required String text}) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 30,
            child: Icon(
              icon,
              size: 29.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      config: Config(
          columns: 7,
          emojiSizeMax: 32 *
              (Platform.isIOS
                  ? 1.30
                  : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
          verticalSpacing: 0,
          horizontalSpacing: 0,
          initCategory: Category.RECENT,
          bgColor: const Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          progressIndicatorColor: Colors.blue,
          showRecentsTab: true,
          recentsLimit: 28,
          noRecentsText: "No Recents",
          noRecentsStyle: const TextStyle(fontSize: 20, color: Colors.black26),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL),
      onEmojiSelected: (category, emoji) {
        print('emoji:- $emoji');
        _controller.text = _controller.text + emoji.emoji;
      },
      onBackspacePressed: () {},
    );
  }
}
