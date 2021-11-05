import 'package:department_chat_app/screens/Pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Department Chat',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('New Group'),
                value: 'New Group',
              ),
              const PopupMenuItem(
                child: Text('New Broadcast'),
                value: 'New Broadcast',
              ),
              const PopupMenuItem(
                child: Text('WhatsApp Web'),
                value: 'WhatsApp Web',
              ),
              const PopupMenuItem(
                child: Text('Starred Message'),
                value: 'Starred Message',
              ),
              const PopupMenuItem(
                child: Text('Settings'),
                value: 'Settings',
              ),
            ];
          }),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt_rounded),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Text('Camera'),
          ChatPage(),
          Text('Status'),
          Text('Calss'),
        ],
      ),
    );
  }
}
