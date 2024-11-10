class Support{
  late String url;
  late String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'].toString(),
      text: json['text'].toString(),
    );
  }
}