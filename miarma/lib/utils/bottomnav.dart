import 'package:flutter/material.dart';

class bottomBar extends StatelessWidget {
  const bottomBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsetsDirectional.only(top: 10),
                color: Colors.black12,
                height: 45,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.home_outlined,
                            color: Colors.white, size: 40),
                      ),
                      SizedBox(width: 45),
                      Container(
                        child: Icon(Icons.search_outlined,
                            color: Colors.white, size: 40),
                      ),
                      SizedBox(width: 45),
                      Container(
                        child: Icon(Icons.smart_display_outlined,
                            color: Colors.white, size: 40),
                      ),
                      SizedBox(width: 45),
                      Container(
                        child: Icon(Icons.local_mall_outlined,
                            color: Colors.white, size: 40),
                      ),
                      SizedBox(width: 45),
                      Container(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/postt.jpeg'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}