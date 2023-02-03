import 'package:baatcheet/colors.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

import '../../../common/enum/message_enum.dart';
import 'display_text_image_gif.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({
    Key? key,
    required this.message,
    required this.date,
    required this.type,
    required this.onRightSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
  }) : super(key: key);
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;

    return SwipeTo(
      onRightSwipe: onRightSwipe,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: senderMessageColor,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: type == MessageEnum.text
                      ? const EdgeInsets.only(
                          left: 10.0,
                          right: 30.0,
                          top: 5.0,
                          bottom: 20.0,
                        )
                      : const EdgeInsets.only(
                          left: 5.0,
                          top: 5.0,
                          right: 5.0,
                          bottom: 25.0,
                        ),
                  child: Column(
                    children: [
                      if (isReplying) ...[
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: backgroundColor.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          child: DisplayTextImageGif(
                            message: repliedText,
                            type: repliedMessageType,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                      DisplayTextImageGif(
                        message: message,
                        type: type,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 10,
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
