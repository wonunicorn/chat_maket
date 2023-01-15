import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

//all user information

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //user avatar with the status - online/offline, green/red
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 28,
                  backgroundImage: AssetImage("assets/avatar.png"),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(34, 39, 0, 0),
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    Icons.check, size: 12, color: whiteColor,
                  ),
                ),

              ],
            ),
          ],
        ),
        const SizedBox(width: 8,),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Amber Griffin',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: darkGreyColor,
                ),
              ),
              Text(
                'Online',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: darkGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
