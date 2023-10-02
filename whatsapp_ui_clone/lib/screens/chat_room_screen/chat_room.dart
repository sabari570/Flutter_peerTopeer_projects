import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/data/data.dart';
import 'package:whatsapp_ui_clone/models/chat_model.dart';
import 'package:whatsapp_ui_clone/screens/chat_room_screen/widgets/message_tile.dart';
import 'package:whatsapp_ui_clone/utils/constants.dart';

class ChatRoom extends StatefulWidget {
  final ChatModel chat;
  const ChatRoom({
    super.key,
    required this.chat,
  });

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  late Icon initialIcon;

  @override
  void initState() {
    super.initState();
    initialIcon = const Icon(Icons.mic);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController messageEditingController = TextEditingController();

    void updateSendIcon(String text) {
      setState(() {
        if (text.isNotEmpty) {
          initialIcon = const Icon(Icons.send);
        } else {
          initialIcon = const Icon(Icons.mic);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chat.profilePic),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "last seen at ${widget.chat.time}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgroundImage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: messages[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    width: MediaQuery.of(context).size.width * 0.82,
                    decoration: BoxDecoration(
                      color: mobileChatBoxColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.emoji_emotions_rounded),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.58,
                          // For the expanding feature of the textfield
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 150.0,
                            ),
                            child: TextField(
                              maxLines: null,
                              cursorColor: tabColor,
                              // onChanged: (value) {
                              //   updateSendIcon(value);
                              // },
                              controller: messageEditingController,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: mobileChatBoxColor,
                                hintText: "Message",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Icon(Icons.attachment),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.camera_alt_rounded),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: initialIcon,
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
