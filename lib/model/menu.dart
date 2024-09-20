class Menu {
  String heading;
  String title;
  String imageUrl;
  String link;
  bool isWebView;

  Menu(
      {required this.heading,
      required this.title,
      required this.imageUrl,
      required this.link,
      this.isWebView = false});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        heading: json["heading"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        link: json["link"],
        isWebView: json["isWebView"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "title": title,
        "imageUrl": imageUrl,
        "link": link,
      };
}
