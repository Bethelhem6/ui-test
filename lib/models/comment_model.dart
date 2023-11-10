
class Comment {
  final String personName;
  final String userName;
  final String postedTime;
  final String comment;
  final int likes;
  final List<Comment> replies;

  Comment({
    required this.personName,
    required this.userName,
    required this.postedTime,
    required this.comment,
    required this.likes,
    required this.replies,
  });
}


