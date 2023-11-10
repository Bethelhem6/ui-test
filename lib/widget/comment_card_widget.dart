import 'package:flutter/material.dart';
import 'package:video_app_ui/routes/routes.dart';

import '../constants/constants.dart';
import '../models/comment_model.dart';
import '../screens/screens.dart';


Widget buildCommentCard(Comment comment, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.jpg"),
          ),
          const SizedBox(width: 8.0),
          Text(
            comment.personName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8.0),
          Text(
            comment.userName,
            style: const TextStyle(color: AppConstants.blueColor),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            comment.postedTime,
            style: const TextStyle(
                color: AppConstants.gray, fontSize: AppConstants.smallFont),
          ),
        ],
      ),
      const SizedBox(height: 5.0),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.comment,
              style: const TextStyle(
                  color: AppConstants.darkerGray,
                  fontSize: AppConstants.mediumFont),
            ),
            const SizedBox(height: 5.0),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: AppConstants.gray,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, customPageRoute(const ReplyCommentScreen()));
                  },
                ),
                Text('${comment.likes} '),
                IconButton(
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: AppConstants.gray,
                  ),
                  onPressed: () {
                    // Handle like button press
                  },
                ),
                Text('${comment.likes} '),
                IconButton(
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: AppConstants.gray,
                  ),
                  onPressed: () {
                    // Handle like button press
                  },
                ),
                const Spacer(),
              ],
            ),
            Container(
              width: 120,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppConstants.gray.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(children: const [
                Text(
                  "View 15 replies",
                  style: TextStyle(
                      color: AppConstants.gray,
                      fontWeight: FontWeight.normal,
                      fontSize: AppConstants.smallFont),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppConstants.gray,
                  size: 15,
                )
              ]),
            )
          ],
        ),
      ),
    ],
  );
}

Widget buildReplayCard(Comment comment) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.jpg"),
          ),
          const SizedBox(width: 8.0),
          Text(
            comment.personName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8.0),
          Text(
            comment.userName,
            style: const TextStyle(color: AppConstants.blueColor),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            comment.postedTime,
            style: const TextStyle(
                color: AppConstants.gray, fontSize: AppConstants.smallFont),
          ),
        ],
      ),
      const SizedBox(height: 5.0),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.comment,
              style: const TextStyle(
                  color: AppConstants.darkerGray,
                  fontSize: AppConstants.mediumFont),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: const [
                Text(
                  "Replying to",
                  style: TextStyle(
                      color: AppConstants.black,
                      fontWeight: FontWeight.bold,
                      fontSize: AppConstants.smallFont),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "John Doe @JohntheD",
                  style: TextStyle(
                      color: AppConstants.orangeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppConstants.smallFont),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    ],
  );
}
