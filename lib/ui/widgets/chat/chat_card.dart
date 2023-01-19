import 'package:flutter/material.dart';

import 'package:surf_practice_chat_flutter/theme.dart';

class ChatCard extends StatelessWidget {
  final String? userAvatar;
  final String? name;
  final String? message;
  final bool isMe;
  final VoidCallback onTap;
  const ChatCard(
      {Key? key,
      this.userAvatar,
      this.name,
      this.message,
      this.isMe = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      CircleAvatar(
        backgroundColor: isMe
            ? const Color.fromARGB(255, 194, 137, 14)
            : AppColors.backGradientBegin,
        child: Text(
          name?[0].toUpperCase() ?? 'U',
          style: TxtStyle.content14Red.copyWith(color: AppColors.textBlue),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Flexible(
        fit: FlexFit.tight,
        child: Container(
          decoration: BoxDecoration(
              color: isMe ? Colors.transparent : AppColors.backGradientBegin,
              border: Border.all(
                  color: isMe
                      ? const Color.fromARGB(255, 245, 187, 28)
                      : AppColors.textRed)),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  name ?? 'ИМЯ НЕИЗВЕСТНО',
                  textAlign: TextAlign.left,
                  style:
                      isMe ? TxtStyle.content20Orange : TxtStyle.content20Blue,
                ),
              ),
              if (message != null)
                const SizedBox(
                  height: 5,
                ),
              if (message != null)
                Text(
                  message ?? '',
                  textAlign: TextAlign.left,
                  style:
                      isMe ? TxtStyle.content14Orange : TxtStyle.content14Blue,
                )
            ],
          ),
        ),
      )
    ];
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200, minHeight: 40.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isMe ? children.reversed.toList() : children,
      ),
    );
  }
}
