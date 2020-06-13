class SynopsisItem {
  final String title;
  final String year;
  final String synopsis;

  SynopsisItem({this.title, this.year, this.synopsis});

  factory SynopsisItem.fromJson(Map<String, dynamic> json) {
    return SynopsisItem(
        title: json["title"] as String,
        year: json["year"] as String,
        synopsis: json["synopsis"] as String);
  }
}