import 'package:deeplaid_apps_models/main.dart';
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
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: '')));
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
                      height: deviceHight * 0.9,
                      width: deviceWidth,

                      //child: Image.asset('assets/images/logo.png'),
                      child: SizedBox(
                        height: deviceHight / 0.90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: SizedBox(
                                child: Image.asset('assets/images/logo.png'),
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: deviceHight * 0.1,
                    width: deviceWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Deeplaid",
                              style: TextStyle(color: Colors.black,
                                  fontSize: 18, fontStyle: FontStyle.normal),
                            ),
                            Text(
                              " Laboratories Limited",
                              style: TextStyle(color: Colors.black,
                                  fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),

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
