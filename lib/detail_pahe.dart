import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DeatailPage extends StatelessWidget {
  String detail;
   DeatailPage({Key? key,required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             decoration: BoxDecoration(
                 color: Colors.yellowAccent,

                 borderRadius: BorderRadius.circular(20)
             ),
             width: double.infinity,
             height: 200,
             child: Center(
               child: Text(
                 detail,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           ),
           SizedBox(height: 20,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               IconButton(onPressed: (){
                 Share.share(detail);
               }, icon: Icon(Icons.share),
               iconSize: 40,),
               IconButton(onPressed: (){
                 FlutterClipboard.copy(detail).then((value) => 
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied"))));
               }, icon: Icon(Icons.copy),
                 iconSize: 40,),
             ],
           )
         ],
        ),
      ),
    );
  }
}
