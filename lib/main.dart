import 'package:flutter/material.dart';
import 'package:memories/startingPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memories/endingPage.dart';
import 'package:memories/welcomePage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image3.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(225, 225, 0, 90), BlendMode.modulate),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome!!',
                    style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'SupermercadoOne-Regular.ttf',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  alignment: Alignment.bottomRight,

                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.black,
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  welcomeApp()),
                        );
                      }
                  ),
                ),
                SizedBox(
                  width: 5,
                ),






              ],
            ),
          ],
        ),
      ),
    );
  }

}


