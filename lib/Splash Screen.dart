import 'package:assignment14/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
  with SingleTickerProviderStateMixin {
    @override
    //initState
    void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      Future.delayed(const Duration(seconds: 4),(){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()));
      });
  }
  //dispose
    @override
    void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff1A1717),
      body:
      Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image:
              AssetImage("images/Todo.png"
              ),
              width: 200,
              ),
            ],
          ),
        ),
      ) ,
    );
  }
  }
