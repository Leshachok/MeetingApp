
import 'package:flutter/material.dart';
import 'package:meeting_app/model/event.dart';
import 'package:meeting_app/model/event_model.dart';
import 'package:provider/provider.dart';

class EventAddScreen extends StatefulWidget {
  @override
  _EventAddScreenState createState() => _EventAddScreenState();
}

class _EventAddScreenState extends State<EventAddScreen> {

  late String title;
  late String description;
  late String date;
  late String location;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children:[
            Stack(
                children:[
                  Image.asset('lib/images/ski.jpg'),
                  Positioned(
                    top: 50,
                    left: 30,
                    child: ElevatedButton(
                      onPressed: onBackButtonPressed,
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
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          maxLength: 20,
                          onChanged: (text){
                            title = text;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Введіть лаконічну тему зустрічі',
                              hintStyle: TextStyle(
                                fontSize: 20
                              )
                          ),
                          style: const TextStyle(
                            fontSize: 40
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          maxLength: 80,
                          maxLines: 2,
                          onChanged: (text){
                            description = text;
                          },
                          decoration: const InputDecoration(
                              hintText: '\nТут місце для інформації',
                          ),
                          style: const TextStyle(
                              fontSize: 18,
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
              // ignore: prefer_const_constructors
              child: TextField(
                maxLength: 25,
                onChanged: (text){
                  date = text;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Введіть дату зустрічі'
                ),
              )
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  maxLength: 25,
                  onChanged: (text){
                    location = text;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.place),
                      hintText: 'Введіть місце зустрічі'
                  ),
                )
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
                      Icons.add,
                      size: 20,
                      color: Colors.lightBlue,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Text(
                          'Пригласить друга',
                          style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightBlue
                          ),
                        )
                    )
                  ],
                )
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: onCreateButtonPressed,
              style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory
              ),
              child: const Text(
                'Создать',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow
                ),
              ),
            ),
          ),
        )
    );
  }

  void onBackButtonPressed() => Navigator.pop(context);

  void onCreateButtonPressed(){
      Event newEvent = Event(title, description, date, location);
      var model = context.read<EventModel>();
      model.addEvent(newEvent);
      Navigator.pop(context);
  }

}