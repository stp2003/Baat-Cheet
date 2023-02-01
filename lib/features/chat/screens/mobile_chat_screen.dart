import 'package:baatcheet/colors.dart';
import 'package:baatcheet/features/auth/controller/auth_controller.dart';
import 'package:baatcheet/models/user_model.dart';
import 'package:baatcheet/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/loader.dart';
import '../widgets/bottom_chat_field.dart';

class MobileChatScreen extends ConsumerWidget {
  //** routes ->
  static const String routeName = '/mobile-chat-screen';

  //??
  final String name;
  final String uid;

  const MobileChatScreen({Key? key, required this.name, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              //** checking for online or offline status of user ->
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                children: [
                  Text(name),
                  Text(
                    snapshot.data!.isOnline ? 'online' : 'offline',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          BottomChatField(
            recieverUserId: uid,
          ),
        ],
      ),
    );
  }
}