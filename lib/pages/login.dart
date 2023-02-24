import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pizza_planet/components/app_bar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Image(
                image: AssetImage('images/main_page_pizza.jpg'),
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.cover,
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height*0.04),
              // margin: MediaQuery.of(context).size.height*0.08,
            ),
            Text('Find your favourite food',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 25.0, right: 15.0),
                  child: Divider(
                    color: Color.fromARGB(255, 146, 146, 146),
                    height: 50,
                  ),
                )),
                Text(
                  'Login / Sign Up',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 15.0, right: 25.0),
                  child: Divider(
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
              child: IntlPhoneField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    // floatingLabelAlignment: FloatingLabelAlignment.center,
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(290, 40)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.red)))),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 25.0, right: 15.0),
                  child: Divider(
                    color: Color.fromARGB(255, 146, 146, 146),
                    height: 50,
                  ),
                )),
                Text('Or'),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 15.0, right: 25.0),
                  child: Divider(
                    color: Color.fromARGB(255, 146, 146, 146),
                    height: 50,
                  ),
                )),
              ],
            ),
            Container(
              child: Image(
                image: AssetImage('images/google_sign_in2.png'),
                width: 290,
                height: 50,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(5),
                  ),

            )

            // SizedBox(

            //   width: 290,
            // child: Container(
            //   height: 40,

            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey.shade300 ),
            //     borderRadius: BorderRadius.all(Radius.circular(8)),

            //   ),
            //   child: SignInButton(
            //     Buttons.Google,
            //     onPressed: (){},
            //     text: "Sign up with Google",

            //     )
            //   ),
            // ),

            // Row(
            //   children: [
            //     Image(image: AssetImage('images/google_sign_in.png'),
            //     width: 290,
            //     height: 40,
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
