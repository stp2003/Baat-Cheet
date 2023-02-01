import 'package:baatcheet/features/chat/controller/chat_controller.dart';
import 'package:baatcheet/widgets/my_message_card.dart';
import 'package:baatcheet/widgets/sender_message_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/message.dart';

class ChatList extends ConsumerStatefulWidget {
  final String recieverUserId;
  // final bool isGroupChat;
  const ChatList({
    Key? key,
    required this.recieverUserId,
    // required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  //** for scrolling when new message is sent or received ->
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream:
          ref.read(chatControllerProvider).chatStream(widget.recieverUserId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        //?? for scrolling to down when new message ->
        SchedulerBinding.instance.addPostFrameCallback((_) {
          messageController.jumpTo(
            messageController.position.maxScrollExtent,
          );
        });

        return ListView.builder(
          controller: messageController,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final messageData = snapshot.data![index];
            var timeSent = DateFormat.Hm().format(messageData.timeSent);

            if (messageData.senderId ==
                FirebaseAuth.instance.currentUser!.uid) {
              return MyMessageCard(
                message: messageData.text,
                date: timeSent,
              );
            }
            return SenderMessageCard(
              message: messageData.text,
              date: timeSent,
            );
          },
        );
      },
    );
  }
}