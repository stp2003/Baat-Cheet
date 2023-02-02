import 'package:baatcheet/common/enum/message_enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DisplayTextImageGif extends StatelessWidget {
  final String message;
  final MessageEnum type;

  const DisplayTextImageGif({
    Key? key,
    required this.message,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : CachedNetworkImage(
            imageUrl: message,
          );
  }
}
