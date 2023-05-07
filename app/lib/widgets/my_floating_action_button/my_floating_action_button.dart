import 'package:app/router/routes.dart';
import 'package:app/widgets/my_floating_action_button/bloc/floating_action_button_bloc.dart';
import 'package:app/widgets/my_modal_bottom_sheet.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({super.key});

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  late final List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: FontAwesomeIcons.pagelines,
      activeIcon: FontAwesomeIcons.xmark,
      backgroundColor: const Color(0xff2ecc71),
      overlayColor: Colors.black,
      overlayOpacity: 0.8,
      spacing: 6,
      onOpen: () async {
        if (cameras.isEmpty) {
          cameras.addAll(await availableCameras());
        }
      },
      children: [
        SpeedDialChild(
            onTap: () {
              context
                  .read<FloatingActionButtonBloc>()
                  .add(DiseaseIdentificationTap());
              MyModalBottomSheet.showModal(context, cameras);
            },
            shape: const CircleBorder(),
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
            onTap: () {
              context
                  .read<FloatingActionButtonBloc>()
                  .add(PestIdentificationTap());
              MyModalBottomSheet.showModal(context, cameras);
            },
            shape: const CircleBorder(),
            child: const Icon(FontAwesomeIcons.bug, color: Color(0xff2ecc71)),
            labelWidget: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text('Nhận diện sâu bệnh',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18)),
            )),
        SpeedDialChild(
            onTap: () {
              context
                  .read<FloatingActionButtonBloc>()
                  .add(PlantIdentificationTap());
              MyModalBottomSheet.showModal(context, cameras);
            },
            shape: const CircleBorder(),
            child: const Icon(
              FontAwesomeIcons.pagelines,
              color: Color(0xff2ecc71),
            ),
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
