import 'package:department_chat_app/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'model/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Color purple = const Color(0xFF6C5CE7);
  Color black = const Color(0xFF191919);
  final msgInputController = TextEditingController();
  late IO.Socket socket;
  ChatController chatController = ChatController(); //Getx

  @override
  void initState() {
    socket = IO.io(
        'http://localhost:4000', //10.0.2.2 for android emulator
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            // .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.connect();
    setUpSocketListener();
    socket.onConnect((data) {
      print('connected from flutter');
    });
    super.initState();
  }

  void sendMessage(String text) {
    var messageJson = {'message': text, 'sentByMe': socket.id};
    socket.emit('message', messageJson);
    chatController.chatMessages.add(Message.fromJson(messageJson));
  }

  void setUpSocketListener() {
    socket.on('message-receive', (data) {
      print(data);
      chatController.chatMessages
          .add(Message.fromJson(data)); //translate json from node
    });
    socket.on('connected-user', (data) {
      print(data);
      chatController.connectedUser.value = data; //translate json from node
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: black,
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Connected User ${chatController.connectedUser}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )),
              Expanded(
                  flex: 9,
                  child: Obx(
                    () => ListView.builder(
                        itemCount: chatController.chatMessages.length,
                        itemBuilder: (context, index) {
                          var currentItem = chatController.chatMessages[index];
                          return MessageItem(
                            sentByMe: currentItem.sentByMe == socket.id,
                            message: currentItem.message,
                          );
                        }),
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: purple,
                    controller: msgInputController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: purple,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () {
                                sendMessage(msgInputController.text);
                                msgInputController.text = '';
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.sentByMe,
    required this.message,
  }) : super(key: key);

  final bool sentByMe;
  final String message;

  @override
  Widget build(BuildContext context) {
    Color purple = const Color(0xFF6C5CE7);
    // Color black = const Color(0xFF191919);
    return Align(
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
            color: sentByMe ? purple : Colors.white,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              message,
              style: TextStyle(
                  fontSize: 18, color: sentByMe ? Colors.white : purple),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '1:10 AM',
              style: TextStyle(
                  fontSize: 10,
                  color: (sentByMe ? Colors.white : purple).withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
