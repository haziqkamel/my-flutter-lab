import 'package:department_chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 2),
          Text(
            contact.name ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
