import 'package:flutter_actor_bloc/models/actor_response.dart';

abstract class PeopleRepository{
  Future<List<People>> fetchPeople();
}