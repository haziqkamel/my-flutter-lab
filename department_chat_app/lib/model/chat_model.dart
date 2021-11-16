import 'package:flutter/material.dart';

class ChatModel {
  String? name;
  Icon? icon;
  bool isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool select = false;
  ChatModel({
    this.name,
    this.icon,
    required this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
  });
}
