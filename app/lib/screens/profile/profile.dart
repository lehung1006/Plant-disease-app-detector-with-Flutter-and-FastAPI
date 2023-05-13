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
          backgroundColor: const Color(0xff2ecc71),
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
                              size: 30, color: Color(0xff2ecc71)))),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, elevation: 0),
                    onPressed: () {
                      GoRouter.of(context).push(RoutesPath.loginRoute);
                    },
                    child: const Text(
                      'Đăng nhập / Đăng ký',
                      style: TextStyle(color: Color(0xff2ecc71)),
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
          Material(
              color: Colors.white,
              child: Column(children: [
                ProfileItem(
                  iconData: FontAwesomeIcons.user,
                  color: const Color(0xff2ecc71),
                  label: 'Thông tin người dùng',
                ),
                const Divider(thickness: 1, height: 1),
                ProfileItem(
                  // iconData: Icons.follow_the_signs,
                  // color: const Color(0xff0984e3),
                  image: Image.asset(
                    'lib/images/flower.png',
                    width: 22,
                    height: 22,
                  ),
                  label: 'Vườn của tôi',
                ),
                const Divider(thickness: 1, height: 1),
                ProfileItem(
                    iconData: FontAwesomeIcons.clockRotateLeft,
                    color: const Color(0xff2980b9),
                    label: 'Lịch sử nhận diện',
                    path: RoutesPath.identifyHistoryRoute),
              ])),
          const SizedBox(height: 10),
          Material(
              color: Colors.white,
              child: Column(
                children: [
                  ProfileItem(
                    iconData: FontAwesomeIcons.pagelines,
                    color: const Color(0xff2ecc71),
                    label: 'Về ứng dụng',
                  ),
                  const Divider(thickness: 1, height: 1),
                  ProfileItem(
                    iconData: FontAwesomeIcons.circleQuestion,
                    color: const Color(0xfffbc40b),
                    label: 'Trung tâm trợ giúp',
                  ),
                  const Divider(thickness: 1, height: 1),
                  ProfileItem(
                    iconData: FontAwesomeIcons.noteSticky,
                    color: const Color(0xff2980b9),
                    label: 'Chính sách',
                  ),
                ],
              )),
          const SizedBox(height: 10),
          Material(
            color: Colors.white,
            child: Column(children: [
              ProfileItem(
                iconData: FontAwesomeIcons.gear,
                color: const Color(0xff2ecc71),
                label: 'Cài đặt',
                path: RoutesPath.settingRoute,
              ),
            ]),
          ),
          // Expanded(
          //     child: Container(
          //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
          //   alignment: Alignment.center,
          //   child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //           elevation: 0,
          //           backgroundColor: const Color(0xff2ecc71),
          //           minimumSize: const Size.fromHeight(40),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(2))),
          //       onPressed: () {},
          //       child: const Text(
          //         'Đăng xuất',
          //         style: TextStyle(color: Colors.white),
          //       )),
          // ))
        ],
      ),
    );
  }
}
