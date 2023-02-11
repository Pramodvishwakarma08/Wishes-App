import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wishes_app/models/wishes.dart';

import '../detail_pahe.dart';

class Msg extends StatelessWidget {
 String? title;
 Msg({required this.title});

 go(BuildContext c ,String text){
   Navigator.push(c, MaterialPageRoute(builder: (_)=>DeatailPage(detail: text,)));
 }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: wishes.where((element) => element.category==title).map((e) => InkWell(
            onTap: (){
              go(context, e.msg!);
            },
            child: Card(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e.msg!, style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  ),),
                )),
          )).toList(),),
        ),
      );
  }
}
