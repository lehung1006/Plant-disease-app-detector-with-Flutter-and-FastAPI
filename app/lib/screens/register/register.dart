import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../router/routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Đăng ký', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft,
                color: Color.fromARGB(255, 243, 87, 39), size: 20),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                color: const Color(0xff95a5a6),
                height: 0.5,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child:
                      Image.asset('lib/images/logo.png', fit: BoxFit.contain)),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text('Tên người dùng'),
                    labelStyle: TextStyle(color: Color(0xff95a5a6)),
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text('Email'),
                    labelStyle: TextStyle(color: Color(0xff95a5a6)),
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text('Mật khẩu'),
                    labelStyle: TextStyle(color: Color(0xff95a5a6)),
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text('Nhập lại mật khẩu'),
                    labelStyle: TextStyle(color: Color(0xff95a5a6)),
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              const SizedBox(height: 40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromARGB(255, 243, 87, 39),
                      minimumSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  onPressed: () {
                    GoRouter.of(context).push(RoutesPath.otpVerificationRoute);
                  },
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
