class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  NewsModel(this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt);

  NewsModel.fromJson(Map<String, dynamic> json)
      : author = json['author'] ?? '',
        title = json['title'] ?? '',
        description = json['content'] ?? '',
        url = json['url'] ?? '',
        urlToImage = json['urlToImage'] ?? '',
        publishedAt = json['publishedAt'] ?? '';
}
