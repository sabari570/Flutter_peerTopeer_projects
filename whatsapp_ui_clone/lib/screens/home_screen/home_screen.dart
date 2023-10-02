import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/data/data.dart';
import 'package:whatsapp_ui_clone/models/chat_model.dart';
import 'package:whatsapp_ui_clone/screens/home_screen/widgets/chat_tile.dart';
import 'package:whatsapp_ui_clone/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          child: const Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          title: const Text("WhatsApp"),
          actions: const [
            Icon(
              Icons.camera_alt_outlined,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg"),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "Chats",
              ),
              Tab(
                text: "Updates",
              ),
              Tab(
                text: "Calls",
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    var jsonData = jsonEncode(info[index]);
                    ChatModel chat = ChatModel.fromJson(jsonData);
                    return ChatTile(chat: chat);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
