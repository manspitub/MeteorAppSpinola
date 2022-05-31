part of 'people_bloc.dart';

@immutable
abstract class PeopleState {
  const PeopleState();

    
  List<Object> get props => [];
}

class PeopleInitial extends PeopleState {}

class PeopleFetched extends PeopleState{
  final List<People> people;
  
  const PeopleFetched(this.people);

    @override
  List<Object> get props => [people];


}

class PeopleFetchError extends PeopleState{
  final String message;
  const PeopleFetchError(this.message);

    @override
  List<Object> get props => [message];
}
