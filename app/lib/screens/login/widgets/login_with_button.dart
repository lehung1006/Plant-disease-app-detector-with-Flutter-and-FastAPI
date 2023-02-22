import 'package:flutter/material.dart';

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
