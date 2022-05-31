import 'package:flutter/material.dart';
import 'package:flutter_actor_bloc/models/actor_response.dart';
import 'package:flutter_actor_bloc/people_bloc/people_bloc.dart';
import 'package:flutter_actor_bloc/repository/people_repository.dart';
import 'package:flutter_actor_bloc/repository/people_repository_impl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/error_page.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({ Key? key }) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late PeopleRepository peopleRepository;


  @override
  void initState() {
    super.initState();
    peopleRepository = PeopleRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
       return BlocProvider(create: (context) { return PeopleBloc(peopleRepository)..add(FetchPeople()); },
      child: Scaffold(body: createPopular(context)),
    );
      
   
  }

  Widget createPopular(BuildContext context){
    return BlocBuilder<PeopleBloc, PeopleState>(
      builder: (context, state) {
        if(state is PeopleInitial){
          return const Center(child: CircularProgressIndicator());
        } else if(state is PeopleFetchError){
          return ErrorPage(
            message: state.message,
            retry: (){
              context.watch<PeopleBloc>()..add(FetchPeople());

            },
          );

        }
        else if(state is PeopleFetched){
          return _createPeopleView(context, state.people);
        } else{
                    return const Text('Not support');

        }
        
      },
    );
  }
  Widget _createPeopleView(BuildContext context, List<People> movies) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30.0),
          height: 100.0,
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              const Expanded(
                flex: 100,
                child: Text(
                  'Popular people',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30.0,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_downward, color: Colors.red),
            ],
          ),
        ),
        SizedBox(
          height: 700,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createPeopleViewItem(context, movies[index]);
            },
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
            ),
            itemCount: movies.length,
          ),
        ),
      ],
    );
  }

   Widget _createPeopleViewItem(BuildContext context, People movie) {
    return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Card(
         color: Colors.grey[800],
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                     width: 75.0,
                     height: 75.0,
                     decoration: new BoxDecoration(
                         shape: BoxShape.circle,
                         image: new DecorationImage(
                             fit: BoxFit.cover,
                             image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.profilePath}')
                         )
                     )),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(movie.name,
                     style: TextStyle (
                         color: Colors.white,
                         fontSize: 22
                     ),
                   ),
                   Text(movie.popularity.toString() +" followers",
                     style: TextStyle (
                         color: Colors.white,
                         fontSize: 16
                     ),
                   )
                 ],
               )
             ],
           ),
         ),
       ),
     );
  }
}