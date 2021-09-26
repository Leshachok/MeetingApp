import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meeting_app/model/event.dart';
import 'package:meeting_app/model/event_model.dart';
import 'package:meeting_app/screens/event_add_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 60),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Предстоящие встречи',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 600,

                child: Consumer<EventModel>(
                    builder: (context, model, child){
                      print('notified');
                      return ListView.builder(
                          itemCount: model.getEvents().length,
                          itemBuilder: (context, position){
                            return getRow(model.getEvent(position));
                          }
                      );
                    }
                ),
              )
            ],
          )
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            child: Row(
              children:[
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                      Icons.menu_outlined,
                      color: Colors.yellow,
                      size: 32,
                  ),
                ),
              ]
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: SizedBox(
          width: 70.0,
          height: 70.0,
          child: RawMaterialButton(
            shape: const CircleBorder(),
            elevation: 0.0,
            fillColor: Colors.yellow,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: onFloatingButtonPressed,
          ),
        )
      );
  }

  void onFloatingButtonPressed(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EventAddScreen()
    ));
  }

  Widget getRow(Event event) {
    String title = event.title;

    return Card(
      child: Text(
          title,
          style: const TextStyle(
            fontSize: 30
          ),
      ),
    );
  }

}
