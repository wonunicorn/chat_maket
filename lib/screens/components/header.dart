import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/components/user_data.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_circle_left_outlined, color: darkGreyColor, size: 27,),
          ),
          const SizedBox(width: 15,),
          const UserInformation(),
          const SizedBox(width: 20,),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_vert, color: darkGreyColor, size: 25),
          ),
        ],
      ),
    );
  }
}
