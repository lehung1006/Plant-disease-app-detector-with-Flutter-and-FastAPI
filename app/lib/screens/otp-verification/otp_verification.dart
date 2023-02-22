import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Nhập mã xác thực')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(height: 15),
          const Text('Mã xác thực đã được gửi tới email'),
          const Text('medfancy0@gmail.com',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: PinCodeTextField(
                appContext: context,
                length: 6,
                keyboardType: TextInputType.number,
                animationDuration: const Duration(microseconds: 0),
                pinTheme: PinTheme(
                    activeColor: Colors.grey,
                    inactiveColor: Colors.grey,
                    selectedColor: const Color.fromARGB(255, 243, 87, 39)),
                onChanged: (value) {}),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 243, 87, 39),
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2))),
              onPressed: () {
                // GoRouter.of(context).push(RoutesPath.otpVerificationRoute);
              },
              child: const Text(
                'Đăng ký',
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(height: 20),
          const Text('Bạn không nhật được mã?'),
          TextButton(onPressed: () {}, child: const Text('Gửi lại'))
        ]),
      ),
    );
  }
}
