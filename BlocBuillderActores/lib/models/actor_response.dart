class PeopleResponse {
  PeopleResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<People> results;
  late final int totalPages;
  late final int totalResults;
  
  PeopleResponse.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>People.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class People {
  People({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });
  late final bool adult;
  late final int gender;
  late final int id;
  late final String name;
  late final double popularity;
  late final String profilePath;
  
  People.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['gender'] = gender;
    _data['id'] = id;
    _data['name'] = name;
    _data['popularity'] = popularity;
    _data['profile_path'] = profilePath;
    return _data;
  }
}
