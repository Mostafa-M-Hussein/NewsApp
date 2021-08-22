class Post {
  String id, title, content, dateWritten, featured_image;

  String votesUp, votesDown;
  List<int> votersUp, votersDown;

  String userId, categoryId;

  Post(
      {this.id,
      this.title,
      this.content,
      this.dateWritten,
      this.featured_image,
      this.votesUp,
      this.votesDown,
      this.votersUp,
      this.votersDown,
      this.userId,
      this.categoryId});
}
