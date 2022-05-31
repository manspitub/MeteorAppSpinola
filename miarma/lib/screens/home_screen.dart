import 'package:flutter/material.dart';
import 'package:miarma_network/screens/login_screen.dart';
import 'package:miarma_network/screens/menu_screen.dart';
import 'package:miarma_network/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userEmail}) : super(key: key);

  final String userEmail;
  
  @override
  _HomeScreenState createState() =>  _HomeScreenState();

   void showSnackbar(BuildContext context, ) {
    final snackBar = SnackBar(
      content:  Text('Welcome again '+userEmail),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

   

}
 
 

class _HomeScreenState extends State<HomeScreen> {
  


 
 


  int likes = 200;
  bool isLiked = false;
  bool isHeartAnimated = false;





  
  
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Container(
              color: Colors.black38,
              height: 0.75,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFFF9F9F9),
          title: Container(
            margin: EdgeInsets.only(top: 10),
            child: SizedBox(
                height: 60,
                child: Image.network(
                    "https://logos-marcas.com/wp-content/uploads/2020/04/Instagram-Logotipo-2016-Presente.png")),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 30,
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.tv_sharp,
                  color: Colors.black,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send_outlined,
                  color: Colors.black,
                  size: 30,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Divider(
                color: Colors.grey,
                height: 0,
                thickness: 0.5,
              ),
              _post(),
            ],
          ),
        ));
  }

      Color _iconColor = Colors.black;

  Widget _post() {
    return Container(
      height: 620,
      child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, i) {
            return _createPost();
          }),
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _createPost() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 12, left: 18, bottom: 12, right: 2),
                    child: ClipRRect(
                      
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                          image: NetworkImage(
                              ('https://ceslava.s3-accelerate.amazonaws.com/2012/12/foto-perfil.jpg')),
                          height: 65,
                          width: 65,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Text("Christian",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                  iconSize: 30,
                ),
              ],
            ),
          ),
          //TODO  Añadir efecto like
          FadeInImage(
          
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://dc722jrlp2zu8.cloudfront.net/media/teachers/luis-miguel-lopez-f2.webp', ),
            fit: BoxFit.cover,
          
          
          ),
          Container(
            padding: EdgeInsets.only(top: 5, left: 7, right: 7, bottom: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(_iconColor == Colors.black){
                        _iconColor = Colors.red;
                        likes = likes +1;
                      } else{
                        likes = likes -1;
                        _iconColor =   Colors.black;
                      }
                     
                    });
                  },
                  icon: Icon(Icons.favorite, color: _iconColor),                  
                ),
                IconButton(
                  onPressed: () {},
                    
                  icon: Image(image: NetworkImage("https://www.pinclipart.com/picdir/middle/571-5717511_comment-instagram-icon-png-clipart.png"),),
          
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                  ),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.save,
                  ),
                  iconSize: 30,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 17.0, right: 17.0, bottom: 10.0),
            
            child: Row(
              children: [
                Text("Liked By ", ),
                Text(likes.toString()+" users" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),) 
              ],
            ),

          ),
          
        ],
      ),
    );
  }
  
}
