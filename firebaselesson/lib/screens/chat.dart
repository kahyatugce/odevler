import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselesson/chat/bubble.dart';
import 'package:firebaselesson/chat/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
final firebaseFireStore = FirebaseFirestore.instance;
class Chat extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  const Chat(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserId});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendmessage(
          widget.receiverUserId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          widget.receiverUserEmail,
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    var aligment = (data["senderId"] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: aligment,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              (data["senderId"] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data["senderId"] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            Text(data["senderEmail"]),
            SizedBox(
              height: 5,
            ),
            Bubble(message: data["message"]),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatServices.getMessage(
            widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
          }
          return ListView(
              children: snapshot.data!.docs
                  .map((document) => _buildMessageItem(document))
                  .toList());
        });
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Enter message",
              ),
            ),
          ),
          IconButton(
              onPressed: sendMessage,
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 35,
                color: Colors.pink,
              ))
        ],
      ),
    );
  }
}
