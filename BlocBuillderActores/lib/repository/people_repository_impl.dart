import 'dart:convert';

import 'package:flutter_actor_bloc/models/actor_response.dart';
import 'package:flutter_actor_bloc/repository/constants.dart';
import 'package:flutter_actor_bloc/repository/people_repository.dart';
import 'package:http/http.dart' as http;

class PeopleRepositoryImpl extends PeopleRepository{
  @override
  Future<List<People>> fetchPeople() async{
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/person/popular?api_key=${Constants.apiKey}&language=en-US&page=1'));
    if(response.statusCode == 200){
      return PeopleResponse.fromJson(jsonDecode(response.body)).results;
    } else { 
      throw Exception('Fail to load people');
    }
  }
  
}