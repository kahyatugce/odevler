import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselesson/model/message_model.dart';
import 'package:flutter/foundation.dart';

class ChatServices extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> sendmessage(String receiverId, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();

    final Timestamp timestamp = Timestamp.now();
    //1
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);
//2
    List<String> IDS = [currentUserId, receiverId];
    IDS.sort();
    String chatRoomID = IDS.join("_");
    await _fireStore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessage(String userId, String otherUserId) {
    List<String> IDS = [userId, otherUserId];
    IDS.sort();
    String chatRoomID = IDS.join("_");
    return _fireStore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
