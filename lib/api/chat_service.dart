import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('chat');

  // Get chat stream
  Stream<QuerySnapshot> get messages {
    return chatCollection.orderBy('timestamp').snapshots();
  }

  // Send message
  Future sendMessage(String message, String userId) async {
    return await chatCollection.add({
      'text': message,
      'senderId': userId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
