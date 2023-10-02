import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/models/chat_model.dart';
import 'package:whatsapp_ui_clone/screens/chat_room_screen/chat_room.dart';
import 'package:whatsapp_ui_clone/utils/constants.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chat;
  const ChatTile({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          //Navigating to chat room screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoom(chat: chat),
            ),
          );
        },
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(chat.profilePic),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chat.name),
                      Text(chat.message),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    chat.time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: tabColor,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 18,
                    width: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: tabColor,
                    ),
                    child: const Text(
                      "3",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
