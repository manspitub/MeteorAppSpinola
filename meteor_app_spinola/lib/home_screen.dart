import 'dart:html';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earth Weather"),
        actions: [
          IconButton(onPressed:  (){
            Navigator.pushNamed(context, '/mars');
          }, icon: Icon(Icons.change_circle))
        ],
        
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            //icono de nube
            
            _weatherIcon(),
            _temperature(),
            _location(),
            _date(),
            _hourlyPrediction(),
          ],
        ),
      ),

    );
  }

  _location(){
    return Row(
      children: [
        Icon(Icons.place),
        SizedBox(width: 10,),
        Text('Sevilla, Sp' )
      ],
    );
  }

  _weatherIcon(){
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Icon(Icons.cloud, size: 80,),
    );
  }
  _temperature(){
    return Text(-10, style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),);

  }

  _date(){
    return Row(
      children: [
        Text("Today:"),
        SizedBox(
          width: 10,
        ),
        Text(
          new DateTime.now().toString()
        )

      ],
    );
    
  }

  _hourlyPrediction() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white),
          bottom: BorderSide(color: Colors.white)
        )
      ),
      child: ListView.builder(itemBuilder: ,),
    )
  }
  
}