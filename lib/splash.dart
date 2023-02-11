import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'main_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  DateTime date = DateTime.now();
  var newTime;
  String? title ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>MainPage()));
      });
    });
  }


  @override
  Widget build(BuildContext context) {
      int newTime = int.parse(DateFormat("kk").format(date)) ;
      if(newTime <= 12){
        title= "Good Moring Deeear";
      }else if(newTime > 12 && newTime < 16 ){
        title= "Good Afternoon Dear";
      }else if(newTime > 16 && newTime < 21 ){
        title= "Good Evening Dear";
      }else{
        title= "Good Goodnight Dear";

      }

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Text(
          "$title",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontFamily: "pramodfont"),
        ),
      ),
    );
  }
}
