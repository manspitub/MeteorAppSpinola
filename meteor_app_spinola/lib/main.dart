import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   static final DateTime now = DateTime.now();

   




  static final DateFormat formatter = DateFormat('hh:MM:SS.ss');
  final String formattednow = formatter.format(now);

  final String morningBackground = 'https://images.unsplash.com/photo-1415750465391-51ed29b1e610?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1vcm5pbmd8ZW58MHx8MHx8&w=1000&q=80';
  final String eveningBackground = 'https://wallpaper.dog/large/20414986.jpg';
  final String nightBackground = 'https://s1.dmcdn.net/v/IUNr81OHlmM0jS8wI/x1080';

   
Image getBackground(){
  if(now.hour > 7 && now.hour < 14 ){
    
    return Image.network(morningBackground, fit: BoxFit.cover, width: double.infinity, height: double.infinity,);
} else if (now.hour > 14 && now.hour < 21){
      return Image.network(eveningBackground,fit: BoxFit.cover, width: double.infinity, height: double.infinity,);

} else{
  return Image.network(nightBackground, fit: BoxFit.cover, width: double.infinity, height: double.infinity);
}

}

 

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      extendBodyBehindAppBar: true,
     appBar: AppBar(
       
       title: Text(""),
       backgroundColor: Colors.transparent,
       elevation: 0,
       leading: IconButton(
         alignment: Alignment.centerRight,
         icon: Icon(Icons.search, size: 30, color: Colors.white, ), 
         onPressed: () {  },
         
       ),
       actions: [
         Icon(Icons.change_circle)
        
       ],

     ),
     body: Container(
       child: Stack(
         children: [
           getBackground()
         ],
       ),
     ),
    );
  }
}
