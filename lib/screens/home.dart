import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/screens/components/header.dart';
import 'package:chat_app/screens/components/msg_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //the list of messages which includes Message Object from Message class
  List messages = [
    Message(
        text: "Hello. How are you?",
        msgType: MessageType.receiver,
        time: DateTime.now()),
    Message(
        text: "How was your day?",
        msgType: MessageType.receiver,
        time: DateTime.now()),
  ];
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: headerColor,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                height: size.height - 145,
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListView.builder(
                    itemCount: messages.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MessageCard(
                        message: messages[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: mainColor,
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          height: 45,
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Row(
            children: [
              Center(
                child: IconButton(
                  onPressed: () async {
                    //for uploading files from device
                    var picked = await FilePicker.platform.pickFiles();
                    if (picked != null) {
                      print(picked.files.first.name);
                    }
                  },
                  icon: const Icon(Icons.drive_folder_upload_outlined,
                      color: greyColor, size: 23),
                ),
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send, color: greyColor, size: 18),
                        onPressed: () {
                          if (controller.text.isNotEmpty) {

                            //adding Message item to a list with set state - that will reload list automatically
                            setState(() {
                              messages.add(Message(
                                text: controller.text.trim(),
                                msgType: MessageType.sender,
                                time: DateTime.now(),
                              ));
                            });
                            controller.clear();
                            //close keyboard when submit
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
