import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:video_app_ui/constants/app_constants.dart';

import '../constants/global_variables.dart';
import '../widget/comment_card_widget.dart';

class ReplyCommentScreen extends StatefulWidget {
  const ReplyCommentScreen({super.key});

  @override
  State<ReplyCommentScreen> createState() => _ReplyCommentScreenState();
}

class _ReplyCommentScreenState extends State<ReplyCommentScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool showEmojiPicker = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppConstants.mediumMargin, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_rounded,
                      color: AppConstants.black,
                      size: 30,
                    )),
                const Text(
                  "Reply",
                  style: TextStyle(
                      color: AppConstants.darkerGray,
                      fontSize: AppConstants.largFont,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: replys.length,
                itemBuilder: (context, index) {
                  return buildReplayCard(replys[index]);
                },
              ),
            ),
            _buildChatInput(),
            showEmojiPicker
                ? Container(
                    padding: AppConstants.smallPadding,
                    height: 200,
                    child: EmojiPicker(
                      textEditingController: _textEditingController,
                      config: Config(
                        bgColor: const Color.fromARGB(255, 234, 248, 255),
                        columns: 8,
                        emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      ),
                    ))
                : Container(),
          ],
        ),
      )),
    );
  }

  Widget _buildChatInput() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        children: [
          const CircleAvatar(
            // Add your user's image here
            backgroundImage: AssetImage("assets/images/user.jpg"),
            backgroundColor: Colors.blue,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextFormField(
              controller: _textEditingController,
              onTap: () {
                setState(() {
                  showEmojiPicker = false;
                });
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: AppConstants.darkerGray,
                  ),
                  onPressed: () {
                    setState(() {
                      showEmojiPicker = !showEmojiPicker;
                    });
                  },
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppConstants.blueColor,
                  ),
                  onPressed: () {
                    // Implement sending message logic
                  },
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                hintText: "Add reply",
                hintStyle: const TextStyle(
                  color: AppConstants.gray,
                  fontWeight: FontWeight.normal,
                  fontSize: AppConstants.mediumFont,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: AppConstants.gray),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      const BorderSide(color: AppConstants.primaryColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
