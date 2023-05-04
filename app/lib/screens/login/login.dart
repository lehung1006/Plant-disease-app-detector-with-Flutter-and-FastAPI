import 'package:app/screens/login/bloc/login_bloc.dart';
import 'package:app/screens/login/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../router/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
              child: LoginForm(
                formKey: _formKey,
              )),
        ));
  }
}

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 60,
                height: 60,
                child: Image.asset('lib/images/logo.png', fit: BoxFit.contain)),
            const SizedBox(height: 20),
            const UsernameField(),
            const Divider(height: 1, thickness: 1),
            const PasswordField(),
            const Divider(height: 1, thickness: 1),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (() {}), child: const Text('Quên mật khẩu?')),
            ),
            const SubmitFormButton(),
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
        ));
  }
}
