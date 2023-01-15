import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: message.msgType == MessageType.sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(

          //define the min/max width and height for message container
          constraints: const BoxConstraints(
              minHeight: 45,
              minWidth: 50,
              maxWidth: 250,
              maxHeight: 400,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: whiteColor,

            //define border radius using the message type - is it message I send? or is it message I receive?
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: message.msgType == MessageType.sender ? const Radius.circular(20) : Radius.zero,
              bottomRight: message.msgType == MessageType.receiver ? const Radius.circular(20) : Radius.zero,
            ),
          ),
          child: Text(
            message.text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: greyColor,
            ),
          ),
        ),
        const SizedBox(height: 7,),
        Text(
          "${message.time.hour.toString().padLeft(2 , '0')}.${message.time.minute.toString().padLeft(2 , '0')}",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: greyColor,
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
