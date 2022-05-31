class MediaRespose {
  MediaRespose({
    required this.data,
    required this.paging,
  });
  late final List<Data> data;
  late final Paging paging;
  
  MediaRespose.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    paging = Paging.fromJson(json['paging']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['paging'] = paging.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
  });
  late final String id;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}

class Paging {
  Paging({
    required this.cursors,
  });
  late final Cursors cursors;
  
  Paging.fromJson(Map<String, dynamic> json){
    cursors = Cursors.fromJson(json['cursors']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cursors'] = cursors.toJson();
    return _data;
  }
}

class Cursors {
  Cursors({
    required this.before,
    required this.after,
  });
  late final String before;
  late final String after;
  
  Cursors.fromJson(Map<String, dynamic> json){
    before = json['before'];
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['before'] = before;
    _data['after'] = after;
    return _data;
  }
}