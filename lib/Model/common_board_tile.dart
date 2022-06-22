class CommonBoardTile {
  final String? profileImageUrl;
  final String userNick;
  final String tileText;
  final int commentCount;
  final int likeCount;
  final int imageCount;

  CommonBoardTile(
      {this.profileImageUrl,
      required this.userNick,
      required this.tileText,
      this.commentCount = 0,
      this.likeCount = 0,
      this.imageCount = 0});
}
