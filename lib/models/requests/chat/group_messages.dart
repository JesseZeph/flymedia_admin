import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flymedia_admin/constants/app_constants.dart';

class GroupMessages {
  String type;
  String? text;
  String? fileName;
  String? downloadUrl;
  String? senderName;
  String? senderId;
  String? senderImg;
  int? timeStamp;
  GroupMessages({
    required this.type,
    this.text,
    this.fileName,
    this.downloadUrl,
    this.senderName,
    this.senderId,
    this.senderImg,
    time,
  }) : timeStamp = time ?? DateTime.now().millisecondsSinceEpoch;

  GroupMessages copyWith({
    String? type,
    ValueGetter<String?>? text,
    ValueGetter<String?>? fileName,
    ValueGetter<String?>? downloadUrl,
    ValueGetter<String?>? senderName,
    ValueGetter<String?>? senderId,
    ValueGetter<String?>? senderImg,
    int? timeStamp,
  }) {
    return GroupMessages(
        type: type ?? this.type,
        text: text?.call() ?? this.text,
        fileName: fileName?.call() ?? this.fileName,
        downloadUrl: downloadUrl?.call() ?? this.downloadUrl,
        senderName: senderName?.call() ?? this.senderName,
        senderId: senderId?.call() ?? this.senderId,
        senderImg: senderImg?.call() ?? this.senderImg,
        time: timeStamp);
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'text': text,
      'fileName': fileName,
      'downloadUrl': downloadUrl,
      'senderName': senderName,
      'senderId': senderId,
      'senderImg': senderImg,
      'timeStamp': timeStamp,
    };
  }

  factory GroupMessages.fromMap(Map<String, dynamic> map) {
    return GroupMessages(
        type: map['type'] ?? '',
        text: map['text'],
        fileName: map['fileName'],
        downloadUrl: map['downloadUrl'],
        senderName: map['senderName'],
        senderId: map['senderId'],
        senderImg: map['senderImg'],
        time: map['timeStamp']);
  }

  @override
  String toString() {
    return 'ChatMessages( type: $type, text: $text, fileName: $fileName, downloadUrl: $downloadUrl, senderName: $senderName, senderId: $senderId, timeStamp: $timeStamp, senderImg: $senderImg)';
  }

  bool isSender(String userId) => senderId == userId;
  bool get isFile => type == 'File';
  bool justUploaded(int uploadTime) => (uploadTime - timeStamp!) <= 3000;
  Color nameDisplayColor(String otherId) {
    return senderId == otherId
        ? Color(mainColor.value)
        : Color(deepGreen.value);
  }
}
