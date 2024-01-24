import 'package:assignment14/Splash%20Screen.dart';
import 'package:assignment14/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A1717),
      body: Center(
        child: Column(
          children: [
            //Text(TodoList)
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 127),
                child: Image(
                  image: AssetImage("images/ToDo_Text.png"),
                  width: 250,
                ),
              ),
            ),

            SizedBox(
              height: 100,
            ),

            //Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                "Save your daily schedule",
                style: TextStyle(
                  color: Color(0xfff8f8f8),
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
              height: 100,
            ),

            //border for Sign-up
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff3CE54D)),
                    fixedSize: MaterialStatePropertyAll(Size(285, 55))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        "Sign-up for free",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    )
                  ],
                )),

            SizedBox(height: 20),

            //Button for Google
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(350, 50),
                  ),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  shadowColor: MaterialStatePropertyAll(Colors.white)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image(
                      image: AssetImage("images/google.jpg"),
                      width: 45,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Continue with Google",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xfff8f8f8),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //Button for Facebook
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(350, 50),
                  ),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  shadowColor: MaterialStatePropertyAll(Colors.white)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: Image(
                      image: AssetImage("images/facebook.png"),
                      width: 80,
                      height: 70,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text("Continue with Facebook",
                      style: TextStyle(
                          fontSize: 19,
                          color: Color(0xfff8f8f8),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //Button Log-in
            MaterialButton(
              onPressed: () {},
              child: Text(
                "Log-in",
                style: TextStyle(
                    color: Color(0xfff8f8f8),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
            //Button guest
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text(
                "Guest",
                style: TextStyle(
                    color: Color(0xfff8f8f8),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
