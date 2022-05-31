// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:register_app/screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Image.network(
                "https://img.freepik.com/vector-gratis/ilustracion-concepto-acceder-al-perfil-movil_114360-83.jpg?size=250&ext=jpg",
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 210, top: 50),
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 50, top: 20, left: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.grey[500]),
                        hintText: 'Email ID',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 50, top: 20, left: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon:
                            Icon(Icons.password, color: Colors.grey[500]),
                        suffixText: "Forgot?"),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Or, login with email",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.network(
                            "https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_1280.png")),
                    IconButton(
                        onPressed: () {},
                        icon: Image.network(
                            "https://e7.pngegg.com/pngimages/662/783/png-clipart-facebook-inc-social-media-computer-icons-social-network-facebook-blue-text.png")),
                    IconButton(
                        onPressed: () {},
                        icon: Image.network(
                            "https://w7.pngwing.com/pngs/755/534/png-transparent-apple-logo-apple-heart-logo-monochrome.png"))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text("New on MiarmaNetwork?"),
                  GestureDetector(
                    child: Text("Register", style: TextStyle(color: Colors.blue),),
                    onTap: (){
                           Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                    },
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          )),
    );
  }
}
