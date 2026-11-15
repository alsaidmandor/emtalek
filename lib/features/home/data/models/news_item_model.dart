class NewsItemModel {
  const NewsItemModel({
    required this.title,
    required this.summary,
    required this.postedAgo,
    this.imageUrl = '',
  });

  final String title;
  final String summary;
  final String postedAgo;
  final String imageUrl;

  factory NewsItemModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const NewsItemModel(
        title: '',
        summary: '',
        postedAgo: '',
        imageUrl: '',
      );
    }
    return NewsItemModel(
      title: json['title']?.toString() ?? '',
      summary: json['summary']?.toString() ?? '',
      postedAgo: json['postedAgo']?.toString() ??
          json['posted_ago']?.toString() ??
          '',
      imageUrl: json['imageUrl']?.toString() ??
          json['image_url']?.toString() ??
          json['image']?.toString() ??
          '',
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'summary': summary,
        'postedAgo': postedAgo,
        'imageUrl': imageUrl,
      };
}

typedef NewsItem = NewsItemModel;
