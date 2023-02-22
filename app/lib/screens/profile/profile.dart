import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import './widgets/profile_item.dart';
import '../../router/routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 87, 39),
          toolbarHeight: 130,
          elevation: 0,
          flexibleSpace: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          child: FaIcon(FontAwesomeIcons.solidUser,
                              size: 30,
                              color: Color.fromARGB(255, 243, 87, 39)))),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, elevation: 0),
                    onPressed: () {
                      GoRouter.of(context).push(RoutesPath.loginRoute);
                    },
                    child: const Text(
                      'Đăng nhập / Đăng ký',
                      style: TextStyle(color: Color.fromARGB(255, 243, 87, 39)),
                    ),
                  )
                ]),
          )
          // child: Row(children: const [
          //   CircleAvatar(
          //     radius: 30,
          //     backgroundImage: AssetImage('lib/images/avatar.jpg'),
          //   ),
          //   SizedBox(width: 10),
          //   Text(
          //     'Lê Hưng',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 22,
          //         fontWeight: FontWeight.w500),
          //   )
          // ]),
          ),
      body: Column(
        children: [
          Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(children: const [
                ProfileItem(
                    iconData: FontAwesomeIcons.user,
                    iconColor: Color.fromARGB(255, 243, 87, 39),
                    label: 'Thông tin người dùng',
                    path: ''),
                Divider(thickness: 1, height: 1),
                ProfileItem(
                    iconData: FontAwesomeIcons.locationDot,
                    iconColor: Color(0xff0984e3),
                    label: 'Địa chỉ giao hàng',
                    path: ''),
              ])),
          const SizedBox(height: 10),
          Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: const [
                  ProfileItem(
                      iconData: FontAwesomeIcons.circleQuestion,
                      iconColor: Color(0xff00b894),
                      label: 'Trung tâm trợ giúp',
                      path: ''),
                  Divider(thickness: 1, height: 1),
                  ProfileItem(
                      iconData: FontAwesomeIcons.utensils,
                      iconColor: Color.fromARGB(255, 243, 87, 39),
                      label: 'Về ứng dụng',
                      path: ''),
                  Divider(thickness: 1, height: 1),
                  ProfileItem(
                      iconData: FontAwesomeIcons.noteSticky,
                      iconColor: Color(0xff0984e3),
                      label: 'Chính sách',
                      path: ''),
                ],
              )),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(children: [
              ProfileItem(
                iconData: FontAwesomeIcons.gear,
                iconColor: Color(0xff00b894),
                label: 'Cài đặt',
                path: RoutesPath.settingRoute,
              ),
            ]),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromARGB(255, 243, 87, 39),
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2))),
                onPressed: () {},
                child: const Text(
                  'Đăng xuất',
                  style: TextStyle(color: Colors.white),
                )),
          ))
        ],
      ),
    );
  }
}
