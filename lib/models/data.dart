// To parse this JSON data, do
//
//     final medias = mediasFromMap(jsonString);

import 'dart:convert';

class Medias {
  Medias({
    required this.data,
  });

  List<Media> data;

  factory Medias.fromJson(String str) => Medias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Medias.fromMap(Map<String, dynamic> json) => Medias(
        data: List<Media>.from(json["data"].map((x) => Media.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Media {
  Media({
    required this.id,
    required this.caption,
    required this.mediaUrl,
    required this.timestamp,
  });

  String id;
  String caption;
  String mediaUrl;
  String timestamp;

  factory Media.fromJson(String str) => Media.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        id: json["id"] ?? "",
        caption: json["caption"] ?? "",
        mediaUrl: json["media_url"] ?? "",
        timestamp: json["timestamp"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "caption": caption,
        "media_url": mediaUrl,
        "timestamp": timestamp,
      };
}
