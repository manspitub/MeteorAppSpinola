import 'dart:ui';

import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Image.network(
              "https://kpsg.com/assets/front-end/images/service-emp01.png",
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: const EdgeInsets.only(right: 210, top: 50),
              child: Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Container(
              height: 100,
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
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "Or, login with",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                ),
                textAlign: TextAlign.center,
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
                        ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 50, top: 20, left: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon:
                            Icon(Icons.person , color: Colors.grey[500]),
                        ),
                  )),

              Padding(
                  padding: const EdgeInsets.only(right: 50, top: 20, left: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Company Name',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon:
                            Icon(Icons.business, color: Colors.grey[500]),
                        ),
                  )),


          ],
        ),
      ),
    );
  }
}
