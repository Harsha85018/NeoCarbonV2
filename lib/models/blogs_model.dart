class Blog {
  final int id;
  final String title;
  final String desc;
  final String author;
  final String image;
  final String link;

  Blog({
    required this.id,
    required this.title,
    required this.desc,
    required this.author,
    required this.image,
    required this.link,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      author: json['author'],
      image: json['image'],
      link: json['link'],
    );
  }
}
