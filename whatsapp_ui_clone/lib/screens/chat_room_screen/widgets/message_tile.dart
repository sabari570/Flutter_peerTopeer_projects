import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/utils/constants.dart';

class MessageTile extends StatelessWidget {
  final Map<String, dynamic> message;
  const MessageTile({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment:
            message['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: message['isMe'] ? messageColor : appBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: message['isMe']
                      ? const Radius.circular(8)
                      : const Radius.circular(0),
                  bottomLeft: const Radius.circular(8),
                  bottomRight: const Radius.circular(8),
                  topRight: message['isMe']
                      ? const Radius.circular(0)
                      : const Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message['text'],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    message['time'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
