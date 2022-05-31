part of 'people_bloc.dart';

@immutable
abstract class PeopleEvent {
  const PeopleEvent();

  List<Object> get props => [];

}

class FetchPeople extends PeopleEvent{
  
}
