import 'package:flutter/material.dart';
import 'package:meeting_app/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'model/event_model.dart';

void main() {
  runApp(MeetingApp());
}

class MeetingApp extends StatefulWidget {
  @override
  _MeetingAppState createState() => _MeetingAppState();
}

class _MeetingAppState extends State<MeetingApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventModel(),
      child: MaterialApp(
        title: 'Meeting App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red
        ),
        home: MainScreen(),
      ),
    );
  }
}


