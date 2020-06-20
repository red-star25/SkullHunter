import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gameapi/Screens/GameHomePage.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage("images/skull.png"),fit: BoxFit.cover,),
                ),
                SizedBox(height: 10,),
                Text("Skull Hunter",style: GoogleFonts.workSans(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),),
                SizedBox(height: 30,),
                SpinKitPouringHourglass(
                  color: Colors.white,
                  size: 50.0,
                ),
                SizedBox(height: 100,),
                Text("Developer: Dhruv Nakum",style: TextStyle(color: Colors.white),)
              ],
            ),
          )
      ),
    );
  }
}