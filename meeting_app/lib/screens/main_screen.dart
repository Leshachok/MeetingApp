import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meeting_app/screens/event_add_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
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

}
