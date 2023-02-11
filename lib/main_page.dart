import 'dart:math';

import 'package:flutter/material.dart';

import 'detail_pahe.dart';
import 'models/meg.dart';
import 'models/wishes.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  List newishes=[];
 go(BuildContext c ,String title){
   Navigator.push(c, MaterialPageRoute(builder: (_)=>Msg(title: title,)));
 }
   // List<Color> mycolor = [Colors.red, Colors.grey, Colors.black];
  // List wishes = [
  //   'MOTHERDAY WISHES',
  //   'FATHERDAY WISHES',
  //   "BRITHDAY WISHES",
  //   'ANNIVERYRDAY WISHES',
  // ];

  @override
  Widget build(BuildContext context) {
     Set mySet ={};
     for(var item in wishes){
       mySet.add(item.category);
     }
     List newishes=[];
     newishes=mySet.toList();

    return Scaffold(
      body: GridView.builder(
          itemCount: newishes.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  go(c, newishes[i]);
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>Msg(title:newishes[i] ,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(2, 2))
                      ]),
                  child: Center(
                      child: Text(
                        newishes[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            );
          }),
    );
  }
}
