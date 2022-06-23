class CommonBoardContent {
  final String? userProfileImageUrl;
  final String userNick;
  final String contentText;
  final List<String> photos;
  final int commentCount;
  final int likeCount;

  CommonBoardContent(
      {this.userProfileImageUrl,
      required this.userNick,
      required this.contentText,
      required this.photos,
      required this.commentCount,
      required this.likeCount});
}
