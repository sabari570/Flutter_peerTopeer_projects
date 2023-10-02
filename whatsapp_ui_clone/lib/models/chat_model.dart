// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatModel {
  final String name;
  final String message;
  final String time;
  final String profilePic;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'message': message,
      'time': time,
      'profilePic': profilePic,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      name: map['name'] as String,
      message: map['message'] as String,
      time: map['time'] as String,
      profilePic: map['profilePic'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
