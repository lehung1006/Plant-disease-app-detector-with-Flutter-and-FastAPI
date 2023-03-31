import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/login_with_button.dart';
import 'package:go_router/go_router.dart';
import '../../router/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool showPassword;

  @override
  void initState() {
    // TODO: implement initState
    showPassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Đăng nhập', style: TextStyle(color: Colors.black)),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft,
                color: Color(0xff2ecc71), size: 20),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
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
                      icon: FaIcon(FontAwesomeIcons.user,
                          color: Color(0xff7f8c8d)),
                      hintText: 'Email/Tên đăng nhập',
                      hintStyle: TextStyle(
                          color: Color(0xff7f8c8d),
                          fontWeight: FontWeight.w400)),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: TextField(
                  obscureText: showPassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: const FaIcon(FontAwesomeIcons.lock,
                          color: Color(0xff7f8c8d)),
                      suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: FaIcon(showPassword
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash)),
                      hintText: 'Mật khẩu',
                      hintStyle: const TextStyle(
                          color: Color(0xff7f8c8d),
                          fontWeight: FontWeight.w400)),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (() {}), child: const Text('Quên mật khẩu?')),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xff2ecc71),
                      minimumSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                  onPressed: () {},
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(RoutesPath.registerRoute);
                  },
                  child: const Text('Chưa có tài khoản?')),
              const SizedBox(height: 10),
              Row(
                children: const [
                  SizedBox(width: 50),
                  Expanded(child: Divider(height: 1, thickness: 1)),
                  SizedBox(width: 10),
                  Text('HOẶC',
                      style: TextStyle(fontSize: 15, color: Color(0xff7f8c8d))),
                  SizedBox(width: 10),
                  Expanded(child: Divider(height: 1, thickness: 1)),
                  SizedBox(width: 50)
                ],
              ),
              const SizedBox(height: 25),
              const LoginWithButton(loginWith: true), // Login with Google
              const SizedBox(height: 10),
              const LoginWithButton(loginWith: false), // Login with Facebook
            ],
          ),
        ));
  }
}
