import 'package:app/screens/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: TextField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            icon: FaIcon(FontAwesomeIcons.user, color: Color(0xff7f8c8d)),
            hintText: 'Email/Tên đăng nhập',
            hintStyle: TextStyle(
                color: Color(0xff7f8c8d), fontWeight: FontWeight.w400)),
        onChanged: (value) =>
            context.read<LoginBloc>().add(UsernameChangeEvent(username: value)),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: TextField(
        obscureText: showPassword,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: const FaIcon(FontAwesomeIcons.lock, color: Color(0xff7f8c8d)),
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
                color: Color(0xff7f8c8d), fontWeight: FontWeight.w400)),
        onChanged: (value) =>
            context.read<LoginBloc>().add(PasswordChangeEvent(password: value)),
      ),
    );
  }
}

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xff2ecc71),
            minimumSize: const Size.fromHeight(40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
        onPressed: () {
          print("Submit form button click");
          context.read<LoginBloc>().add(LoginSubmitFormEvent());
        },
        child: const Text(
          'Đăng nhập',
          style: TextStyle(color: Colors.white),
        ));
  }
}

class LoginWithButton extends StatelessWidget {
  const LoginWithButton({super.key, required this.loginWith});

  final bool loginWith; // true for Google and false for Facebook

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: const Color(0xff7f8c8d))),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                    loginWith == true
                        ? 'lib/images/google.png'
                        : 'lib/images/facebook.png',
                    fit: BoxFit.contain),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.center,
                child: Text(loginWith == true
                    ? 'Tiếp tục với Google'
                    : 'Tiếp tục với Facebook'),
              ))
            ],
          )),
    );
  }
}
