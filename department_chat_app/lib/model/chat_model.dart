import 'package:flutter/material.dart';

class ChatModel {
  String? name;
  Icon? icon;
  bool isGroup;
  String? time;
  String? currentMessage;
  ChatModel({
    this.name,
    this.icon,
    required this.isGroup,
    this.time,
    this.currentMessage,
  });
}
