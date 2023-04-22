import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_planet/main_screen.dart';
import 'package:pizza_planet/utils.dart';
import 'package:pinput/pinput.dart';

import 'login.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var otp_code="";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const Image(image: AssetImage('images/otpImg.png')),
            const Text('Find your favourite food',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 25.0, right: 15.0),
                      child: const Divider(
                        color: Color.fromARGB(255, 146, 146, 146),
                        height: 50,
                      ),
                    )),
                const Text(
                  'Enter the verification code',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 25.0),
                      child: const Divider(
                        color: Color.fromARGB(255, 146, 146, 146),
                        height: 50,
                      ),
                    ))
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 62,
              width: 290,
              child: Pinput(
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 50,
                  textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFB4B4B4),width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                length: 6,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                autofocus: true,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                // onCompleted: (pin){},
                onChanged: (value) {
                  otp_code = value;
                },
              ),
            ),
            const SizedBox(height:10),
            ElevatedButton(
              onPressed: () async{
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: Login.verify, smsCode: otp_code);
                  await auth.signInWithCredential(credential);
                  SharedPref.addBoolToSF('LoggedIn', true);
                  SharedPref.addStringToSF("phoneNumber", Login.pn);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                }
                catch (e){
                  print('wrong otp');
                }
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(290, 40)),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.red)))),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(left: 25.0, top: 20.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      child: const Text("Edit your number",style: TextStyle(color: Colors.black),),)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
