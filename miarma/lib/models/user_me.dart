class UserMeResponse {
  UserMeResponse({
    required this.mediaCount,
    required this.accountType,
    required this.username,
    required this.id,
  });
  late final int mediaCount;
  late final String accountType;
  late final String username;
  late final String id;
  
  UserMeResponse.fromJson(Map<String, dynamic> json){
    mediaCount = json['media_count'];
    accountType = json['account_type'];
    username = json['username'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['media_count'] = mediaCount;
    _data['account_type'] = accountType;
    _data['username'] = username;
    _data['id'] = id;
    return _data;
  }
}