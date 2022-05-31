class MediaDisplayedRespose {
  MediaDisplayedRespose({
    required this.id,
    required this.mediaType,
    required this.mediaUrl,
    required this.username,
    required this.timestamp,
  });
  late final String id;
  late final String mediaType;
  late final String mediaUrl;
  late final String username;
  late final String timestamp;
  
  MediaDisplayedRespose.fromJson(Map<String, dynamic> json){
    id = json['id'];
    mediaType = json['media_type'];
    mediaUrl = json['media_url'];
    username = json['username'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['media_type'] = mediaType;
    _data['media_url'] = mediaUrl;
    _data['username'] = username;
    _data['timestamp'] = timestamp;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
  });
  late final String id;
  
  
}