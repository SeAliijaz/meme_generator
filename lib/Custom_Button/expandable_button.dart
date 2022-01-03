import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ExpandableFloatingActionButton extends StatelessWidget {
  ///ExpandableFloatingActionButton
  ///Code was too long
  ///That's why made widget here
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      foregroundColor: Colors.white,
      visible: true,
      closeManually: false,
      curve: Curves.ease,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      elevation: 8.0,
      shape: StadiumBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.camera_alt),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          label: 'Camera',
          labelStyle: TextStyle(fontSize: 15.0),
          onTap: () {},
        ),
        SpeedDialChild(
          child: Icon(Icons.photo),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
          label: 'Gallery',
          labelStyle: TextStyle(fontSize: 15.0),
          onTap: () {},
        ),
      ],
    );
  }
}
