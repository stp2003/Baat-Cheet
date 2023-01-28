import 'package:baatcheet/common/utils/utils.dart';
import 'package:baatcheet/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepository({
    required this.firestore,
    required this.auth,
  });

  //?? sending message logic ->
  void sendMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    required UserModel senderUser,
  }) async {
    try {
      var timeSent = DateTime.now();
      UserModel recieverUserData;

      var userdataMap =
          await firestore.collection('users').doc(recieverUserId).get();

      recieverUserData = UserModel.fromMap(userdataMap.data()!);

    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
