import 'package:deeplaid_apps_models/login_deeplaid_apps/login.dart';
import 'package:deeplaid_apps_models/main.dart';
import 'package:deeplaid_apps_models/otp_deeplaid_apps/otp.dart';
import 'package:flutter/material.dart';

class SplashDeeplaid extends StatefulWidget {
  const SplashDeeplaid({Key? key}) : super(key: key);

  @override
  State<SplashDeeplaid> createState() => _SplashDeeplaidState();
}

class _SplashDeeplaidState extends State<SplashDeeplaid> {
  @override
  void initState() {
    super.initState();
    _navigationHome();
  }

  _navigationHome() async {
    await Future.delayed(const Duration(milliseconds: 2200), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => otpModel(title: '')));
  }

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.white],
                ),
              ),

              //color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(
                      height: deviceHight * 0.93,
                      width: deviceWidth,

                      //child: Image.asset('assets/images/logo.png'),
                      child: SizedBox(
                        height: deviceHight / 0.90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: SizedBox(
                                height: 120,
                                width: 120,
                                child: Image.asset('assets/images/logo.png'),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: deviceHight * 0.07,
                    width: deviceWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Deeplaid",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontStyle: FontStyle.normal),
                            ),
                            Text(
                              " Laboratories Limited",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Schuyler"),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )

            // SizedBox(
            //   height: 200,
            // ),
          ],
        ),
      ),
    );
  }
}
