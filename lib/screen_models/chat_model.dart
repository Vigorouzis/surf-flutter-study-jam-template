// import 'package:flutter/material.dart';

// import 'package:surf_practice_chat_flutter/data/chat/models/message.dart';
// import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

// class ChatModel extends ChangeNotifier {
//   ChatModel({
//     required this.chatRepository,
//   });
//   // repository
//   final ChatRepository chatRepository;

//   // text controllers on screen
//   final nameTextController = TextEditingController();
//   final messageTextController = TextEditingController();

//   // messages value and getter
//   List<ChatMessageDto>? _messages;
//   List<ChatMessageDto>? get messages => _messages;

//   // messages loading status value and getter
//   bool _isMessagesLoading = false;
//   bool get isMessagesLoading => _isMessagesLoading;

//   // messages sending status value and getter
//   bool _isMessageSending = false;
//   bool get isMessageSending => _isMessageSending;

//   // error message
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;

//   Future<void> sendMessage() async {
//     final nickname = nameTextController.text;
//     final message = messageTextController.text;
//     if (nickname.isEmpty || nickname.length > ChatRepository.maxNameLength) {
//       _errorMessage =
//           'Имя не должно быть пустым или превышать ${ChatRepository.maxNameLength} символов';
//       notifyListeners();
//       return;
//     } else if (message.isEmpty ||
//         message.length > ChatRepository.maxMessageLength) {
//       _errorMessage =
//           'Сообщение не должно быть пустым или превышать ${ChatRepository.maxMessageLength} символов';
//       notifyListeners();
//       return;
//     } else {
//       _isMessageSending = true;
//       try {
//         await chatRepository.sendMessage(nickname, message);
//       } catch (e) {
//         _errorMessage = 'Ощибка сервера при отправке сообщения';
//         _isMessageSending = false;
//         notifyListeners();
//         return;
//       }
//       _isMessageSending = false;
//       messageTextController.clear();
//       notifyListeners();
//     }
//   }

//   Future<void> getMessages() async {
//     _isMessagesLoading = true;
//     notifyListeners();
//     try {
//       _messages = await chatRepository.messages;
//     } catch (e) {
//       _errorMessage = 'Ощибка сервера при получении сообщений';
//       notifyListeners();
//     }
//     _isMessagesLoading = false;
//     notifyListeners();
//   }
// }
