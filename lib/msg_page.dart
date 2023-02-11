import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wishes_app/models/wishes_model.dart';
import '../details_page.dart';

class MsgPage extends StatelessWidget {
  String? title;
  MsgPage({required this.title});

  go(BuildContext c, String text) {
    Navigator.push(
        c,
        MaterialPageRoute(
            builder: (_) => DetailsPage(
                  details: text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: wishes
              .where((element) => element.category == title)
              .map((e) => InkWell(
                    onTap: () {
                      go(context, e.msg!);
                    },
                    child: Card(
                        child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.grey,
                      width: double.infinity,
                      child: Text(
                        e.msg!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        ),
                      ),
                    )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
