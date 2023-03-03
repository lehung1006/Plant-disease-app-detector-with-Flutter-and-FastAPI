import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: FontAwesomeIcons.pagelines,
      activeIcon: FontAwesomeIcons.xmark,
      backgroundColor: const Color(0xff2ecc71),
      overlayColor: Colors.black,
      overlayOpacity: 0.8,
      spacing: 6,
      children: [
        SpeedDialChild(
            child:
                const Icon(FontAwesomeIcons.disease, color: Color(0xff2ecc71)),
            labelWidget: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text('Nhận diện bệnh',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18)),
            )),
        SpeedDialChild(
            child: const Icon(FontAwesomeIcons.bug, color: Color(0xff2ecc71)),
            labelWidget: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text('Nhận diện sâu bọ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18)),
            )),
        SpeedDialChild(
            child: const Icon(FontAwesomeIcons.pagelines,
                color: Color(0xff2ecc71)),
            labelWidget: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text('Nhận diện cây',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18)),
            )),
      ],
    );
  }
}
