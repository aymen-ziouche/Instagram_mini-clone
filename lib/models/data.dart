class Media {
  Media({
    required this.id,
    required this.caption,
    required this.mediaUrl,
    required this.timestamp,
  });

  int id;
  String caption;
  String mediaUrl;
  String timestamp;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        caption: json["caption"],
        mediaUrl: json["media_url"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "media_url": mediaUrl,
        "timestamp": timestamp,
      };
}
