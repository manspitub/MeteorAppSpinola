class LoginResponse {
  LoginResponse({
    required this.token,
    required this.nick,
    required this.email,
    required this.avatar,
    required this.created,
    required this.active,
  });
  late final String token;
  late final String nick;
  late final String email;
  late final String avatar;
  late final String created;
  late final bool active;
  
  LoginResponse.fromJson(Map<String, dynamic> json){
    token = json['token'];
    nick = json['nick'];
    email = json['email'];
    avatar = json['avatar'];
    created = json['created'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['nick'] = nick;
    _data['email'] = email;
    _data['avatar'] = avatar;
    _data['created'] = created;
    _data['active'] = active;
    return _data;
  }
}

class LoginDto {
  LoginDto({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}