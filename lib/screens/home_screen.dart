import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../widget/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBars = true;
  bool showDrawer = false;
  bool showFullText = false;
  final TextEditingController _textEditingController = TextEditingController();
  bool showEmojiPicker = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showDrawer = false;
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background_image.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          showBars ? drawer() : const Text(""),
          showDrawer ? drawerItemsWidget() : Container(),
          showBars ? sideIcons() : const Text(""),
          showBars ? textMessage() : const Text(""),
          !showBars
              ? Positioned(
                  bottom: 70,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showBars = true;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: AppConstants.containerBg,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: const Icon(Icons.keyboard_double_arrow_right),
                    ),
                  ))
              : const Text(""),
        ]),
      ),
      bottomSheet: showBars ? bottomSheetContainer() : const Text(""),
    );
  }

  Container bottomSheetContainer() {
    return Container(
      padding: AppConstants.smallPadding,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SvgPicture.asset("assets/icons/apps_icon.svg",
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppConstants.primaryColor,
                    BlendMode.srcATop,
                  )),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Apps",
                style: TextStyle(color: AppConstants.primaryColor),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset("assets/icons/video_icon.svg",
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppConstants.iconColor,
                    BlendMode.srcATop,
                  )),
              const SizedBox(height: 5),
              const Text(
                "Qucon",
                style: TextStyle(
                    color: AppConstants.primarytTextColor,
                    fontSize: AppConstants.smallFont),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset("assets/icons/center_icon.svg",
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppConstants.iconColor,
                    BlendMode.srcATop,
                  )),
              const SizedBox(height: 5),
              const Text(
                "Zaddy",
                style: TextStyle(
                    color: AppConstants.primarytTextColor,
                    fontSize: AppConstants.smallFont),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset("assets/icons/send_icon.svg",
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppConstants.iconColor,
                    BlendMode.srcATop,
                  )),
              const SizedBox(height: 5),
              const Text(
                "Organize",
                style: TextStyle(
                    color: AppConstants.primarytTextColor,
                    fontSize: AppConstants.smallFont),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset("assets/icons/profile.svg",
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppConstants.iconColor,
                    BlendMode.srcATop,
                  )),
              const SizedBox(height: 5),
              const Text(
                "Profile",
                style: TextStyle(
                    color: AppConstants.primarytTextColor,
                    fontSize: AppConstants.smallFont),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned textMessage() {
    return Positioned(
      bottom: 70,
      right: 0,
      left: 0,
      child: Container(
        margin: const EdgeInsets.only(
            left: AppConstants.mediumMargin,
            bottom: AppConstants.smallMargin,
            right: 40),
        padding: AppConstants.mediumPadding,
        width: 340,
        height: showFullText ? 500 : 150,
        decoration: BoxDecoration(
          color: AppConstants.containerBg.withAlpha(200),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 0.5, color: AppConstants.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showFullText
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showFullText = !showFullText;
                          });
                        },
                        child: Container(
                          padding: AppConstants.smallPadding,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppConstants.black,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 0.5, color: AppConstants.black),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "...Less",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_double_arrow_down_outlined,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                showFullText
                    ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut spania korean labore et dolore magna aliqua. consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut spania korean labore et dolore magna aliqua."
                    : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor  consectetur adipiscing elit...",
                overflow: TextOverflow.clip,
                maxLines: showFullText ? null : 5,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: AppConstants.primarytTextColor,
                  fontSize: AppConstants.mediumFont,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "27, Oct 2020 @5:23pm",
                  style: TextStyle(
                    color: AppConstants.lightPink,
                    fontSize: AppConstants.smallFont,
                  ),
                ),
                !showFullText
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            showFullText = !showFullText;
                          });
                        },
                        child: Container(
                          padding: AppConstants.smallPadding,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppConstants.black,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 0.5, color: AppConstants.black),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "...More",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_double_arrow_up_outlined,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned sideIcons() {
    return Positioned(
      bottom: 70,
      right: -15,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppConstants.mediumMargin),
            width: 40,
            child: Column(children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/user.jpg"),
              ),
              const SizedBox(
                height: 8,
              ),
              icons("", Icons.list_alt_outlined),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                  onTap: () {
                    showComments();
                  },
                  child: icons("45k", Icons.message)),
              const SizedBox(
                height: 15,
              ),
              icons("45k", Icons.favorite),
              const SizedBox(
                height: 15,
              ),
              icons("", Icons.share_outlined),
            ]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showBars = false;
              });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: AppConstants.containerBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )),
              child: const Icon(Icons.keyboard_double_arrow_left),
            ),
          )
        ],
      ),
    );
  }

  Positioned drawerItemsWidget() {
    return Positioned(
        top: 0,
        left: 0,
        child: Container(
          padding: AppConstants.largePadding,
          height: 350,
          width: 240,
          decoration: BoxDecoration(
            color: AppConstants.primarytTextColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: drawerItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Icon(
                        drawerItem[index]["icon"],
                        color: drawerItem[index]["color"],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        drawerItem[index]["title"],
                        style: const TextStyle(
                            fontSize: AppConstants.mediumFont,
                            color: AppConstants.darkerGray),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }

  Positioned drawer() {
    return Positioned(
      top: 20,
      left: 20,
      child: GestureDetector(
        onTap: () {
          setState(() {
            showDrawer = true;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(3),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: AppConstants.primarytTextColor,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(width: 0.5, color: AppConstants.orangeColor)),
          child: SvgPicture.asset("assets/icons/drawer.svg",
              height: 20,
              width: 20,
              colorFilter: const ColorFilter.mode(
                AppConstants.blueColor,
                BlendMode.srcATop,
              )),
        ),
      ),
    );
  }

  showComments() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              height: 650,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 130,
                    padding: AppConstants.smallPadding,
                    decoration: BoxDecoration(
                      color: AppConstants.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "45k Comments",
                      style: TextStyle(
                          color: AppConstants.primarytTextColor,
                          fontSize: AppConstants.mediumFont),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.largeMargin),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: comments.length,
                              itemBuilder: (context, index) {
                                return buildCommentCard(
                                    comments[index], context);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildChatInput(),
                          showEmojiPicker
                              ? Container(
                                  padding: AppConstants.smallPadding,
                                  height: 300,
                                  child: EmojiPicker(
                                    textEditingController:
                                        _textEditingController,
                                    config: Config(
                                      bgColor: const Color.fromARGB(
                                          255, 234, 248, 255),
                                      columns: 8,
                                      emojiSizeMax:
                                          32 * (Platform.isIOS ? 1.30 : 1.0),
                                    ),
                                  ))
                              : Container(),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
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
              keyboardType: TextInputType.none,
              controller: _textEditingController,
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
                hintText: "Add comment",
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
