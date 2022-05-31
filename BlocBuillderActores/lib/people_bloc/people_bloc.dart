import 'package:bloc/bloc.dart';
import 'package:flutter_actor_bloc/repository/people_repository.dart';
import 'package:meta/meta.dart';

import '../models/actor_response.dart';


part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {

  final PeopleRepository peopleRepository;


  PeopleBloc(this.peopleRepository) : super(PeopleInitial()) {
    on<FetchPeople>(_peopleFetched);
  }


  void _peopleFetched(FetchPeople event, Emitter<PeopleState> emit) async {
    try {
      final people = await peopleRepository.fetchPeople();
      emit(PeopleFetched(people));
      return;
    } on Exception catch (e) {
      emit(PeopleFetchError(e.toString()));
    }
  }
}
