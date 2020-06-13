import 'package:panini/models/SynopsisItem.dart';

class SynopsisResult {
  final List<SynopsisItem> items;

  SynopsisResult(this.items);

  factory SynopsisResult.fromJson(Map<String, dynamic> json) {
    final listItems = (json["items"] as List).cast<Map<String, dynamic>>()?.map(
      (item) {
        return SynopsisItem.fromJson(item);
      },
    )?.toList();

    return SynopsisResult(listItems);
  }
}