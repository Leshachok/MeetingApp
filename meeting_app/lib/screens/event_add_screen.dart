
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meeting_app/model/user.dart';

class EventAddScreen extends StatefulWidget {
  @override
  _EventAddScreenState createState() => _EventAddScreenState();
}

class _EventAddScreenState extends State<EventAddScreen> {

  List<Widget> widgets = [];
  List<User> users = [];


  @override
  void initState() {
    super.initState();
    getJsonFromFile();
  }

  void getJsonFromFile() async{
    String json = await rootBundle.loadString('lib/users.json');
    var list = (jsonDecode(json) as List<dynamic>);
    list.forEach((element) {
      users.add(User.fromJson(element));
    });
    for(var i = 0; i < users.length; i++ ){
      widgets.add(getRow(i));
    }
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:[
            Stack(
                children:[
                  Image.asset('lib/images/ski.jpg'),
                  Positioned(
                    top: 50,
                    left: 30,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Icon(Icons.arrow_back_rounded),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          fixedSize: Size(50, 50),
                          primary: const Color.fromARGB(150, 0, 0, 0)
                      ),
                    ),
                  )
                ]
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: const Text(
                          'Название',
                          style: TextStyle(
                              fontSize: 40
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: const Text(
                          'Еще куча полезного текста',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        '11 сентября 2002 года',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      )
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.place,
                    size: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Где-то в ебенях',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 10,
                thickness: 0.8,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.people,
                    size: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        'Участники',
                        style: TextStyle(
                            fontSize: 18
                        ),
                      )
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 200,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      children: widgets,
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                )
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: (){},
              style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory
              ),
              child: const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ),
          ),
        )
    );
  }

  Widget getRow(int position) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Container(
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      users[position].name,
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                  )
                ],
              ),
            ),
            getStatus(position)
          ]
      ),
    );
  }

  getStatus(int pos){
    Color textColor = users[pos].status == 0 ? Colors.red : users[pos].status == 1 ? Colors.green : Colors.blue;
    Color backColor = textColor.withAlpha(50);
    String text = users[pos].status == 0 ? "Слился" : users[pos].status == 1 ? "Будет" : "Зачинщик";

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: backColor
      ),
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 4),
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontSize: 18
        ),
      ),
    );
  }
}