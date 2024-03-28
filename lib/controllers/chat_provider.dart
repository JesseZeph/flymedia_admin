// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flymedia_admin/models/requests/chat/group_chat_req.dart';
// import 'package:flymedia_admin/models/requests/chat/group_messages.dart';
// import 'package:flymedia_admin/models/response/network_response.dart';
// import 'package:flymedia_admin/services/repository/global_variables.dart';

// import '../services/config.dart';

// class ChatProvider extends ChangeNotifier {
//   final _db = FirebaseFirestore.instance;
//   List<GroupChat> userGroups = [];
//   bool fetchingChat = true;
//   // int? uploadTime;
//   // double taskProgress = 0;
//   bool uploadingFile = false;
//   bool downloadingFile = false;
//   String? currentTaskId;

//   fetchUserMessages(String userId, String userType) async {
//     try {
//       List<NetworkResponse> messages = await Future.wait([
//         repository.getRequest(
//             endpoint: AppConfig.chat,
//             query: {"user_id": userId, "user_type": userType}),
//       ]);

//       if (messages.first.status) {
//         List initList = messages.first.data;
//         userGroups = initList.map((item) => GroupChat.fromMap(item)).toList();
//       }
//     } catch (e, s) {
//       debugPrintStack(stackTrace: s);
//     }
//     fetchingChat = false;

//     notifyListeners();
//   }

//   updateChat(
//       String? chatId, String? lastMessage, String userId, String userType,
//       {bool isGroup = false}) async {
//     var endPointToUse = AppConfig.chat;
//     await repository.putRequest(endpoint: endPointToUse, body: {
//       "chat_id": chatId ?? '',
//       "last_message": lastMessage ?? '',
//       "user_type": userType
//     });
//     await fetchUserMessages(userId, userType);
//   }

//   updateChatStatus(String? chatId, String userId, String userType,
//       {bool isGroup = false}) async {
//     var endPointToUse = '${AppConfig.chat}/status';
//     await repository.postRequest(
//         endpoint: endPointToUse,
//         body: {"chat_id": chatId ?? '', "user_type": userType});

//     await fetchUserMessages(userId, userType);
//   }

//   Query<GroupMessages> groupChatStream({String? groupName}) {
//     return _db
//         .collection('groups')
//         .doc('chats')
//         .collection(groupName ?? '')
//         // .orderBy('timestamp', descending: true)
//         .withConverter<GroupMessages>(
//             fromFirestore: (snapshot, _) =>
//                 GroupMessages.fromMap(snapshot.data() ?? {}),
//             toFirestore: (message, _) => message.toMap());
//   }

//   sendGroupMessage(GroupMessages message, String groupName) async {
//     try {
//       _db
//           .collection('groups')
//           .doc('chats')
//           .collection(groupName)
//           .add(message.toMap());
//     } catch (e, s) {
//       debugPrint(e.toString());
//       debugPrintStack(stackTrace: s);
//     }
//   }
// }
