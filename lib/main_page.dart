import 'dart:math';

import 'package:flutter/material.dart';

import 'msg_page.dart';
import 'models/wishes_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

 go(BuildContext c ,String title){
   Navigator.push(c, MaterialPageRoute(builder: (_)=>MsgPage(title: title,)));
 }

  @override
  Widget build(BuildContext context) {
     Set mySet ={};
     for(var item in wishes){
       mySet.add(item.category);
     }
     List newishes=mySet.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent ,
        elevation: 0,
      ),
      body: GridView.builder(
          itemCount: newishes.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  go(c, newishes[i]);
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
                            offset: const Offset(2, 2))
                      ]),
                  child: Center(
                      child: Text(
                        newishes[i],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
