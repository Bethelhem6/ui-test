import 'package:flutter/material.dart';

import '../models/comment_model.dart';
import 'app_constants.dart';

List<Map> drawerItem = [
  {
    "title": "Post a Seequl",
    "icon": Icons.add_box,
    "color": AppConstants.blueColor
  },
  {
    "title": "View your likes",
    "icon": Icons.favorite,
    "color": AppConstants.redColor
  },
  {
    "title": "Your Seequl posts",
    "icon": Icons.videocam_sharp,
    "color": Colors.brown.shade800
  },
  {
    "title": "Reference contribution",
    "icon": Icons.list_alt_rounded,
    "color": AppConstants.darkerGray
  },
  {
    "title": "Hashtag challengs",
    "icon": Icons.tag,
    "color": AppConstants.black
  },
  {"title": "Notification", "icon": Icons.notifications, "color": Colors.green},
  {"title": "About a SeqQuul", "icon": Icons.info, "color": Colors.brown},
];
final List<Comment> comments = [
  Comment(
    personName: 'John Doe',
    userName: '@johndoe',
    postedTime: '2 hours ago',
    comment:
        "This recipe looks delicious! 🍲 Can't wait to try it myself.Your photography skills are on point! 📷 Such a beautiful shot.",
    likes: 5,
    replies: [
      Comment(
        personName: 'Jane Smith',
        userName: '@janesmith',
        postedTime: '1 hour ago',
        comment: 'I agree with you!',
        likes: 2,
        replies: [],
      ),
    ],
  ),
  Comment(
    personName: 'John Doe',
    userName: '@johndoe',
    postedTime: '2 hours ago',
    comment:
        'This is an amazing post ❣️ 💖 💕 💗!Great job on the presentation! 🙌 Looking forward to more.',
    likes: 45,
    replies: [
      Comment(
        personName: 'Jane Smith',
        userName: '@janesmith',
        postedTime: '1 hour ago',
        comment: 'I agree with you!',
        likes: 2,
        replies: [],
      ),
    ],
  ),
  Comment(
    personName: 'John Doe',
    userName: '@johndoe',
    postedTime: '2 hours ago',
    comment:
        'Congratulations on your new achievement! 🎉 You deserve it.This is an amazing post!',
    likes: 5,
    replies: [
      Comment(
        personName: 'Jane Smith',
        userName: '@janesmith',
        postedTime: '1 hour ago',
        comment: 'I agree with you!',
        likes: 2,
        replies: [],
      ),
    ],
  ),
];

final List<Comment> replys = [
  Comment(
    personName: 'John Doe',
    userName: '@johndoe',
    postedTime: '2 hours ago',
    comment:
        "This recipe looks delicious! 🍲 Can't wait to try it myself.Your photography skills are on point! 📷 Such a beautiful shot.",
    likes: 5,
    replies: [
      Comment(
        personName: 'Jane Smith',
        userName: '@janesmith',
        postedTime: '1 hour ago',
        comment: 'I agree with you!',
        likes: 2,
        replies: [],
      ),
    ],
  ),
];
