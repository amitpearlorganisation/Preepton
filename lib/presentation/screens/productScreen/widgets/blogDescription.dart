import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogDescriptionScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  const BlogDescriptionScreen({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             width: double.infinity,
             height: MediaQuery.of(context).size.height*0.4,
             child: Image.asset(imageUrl, width: double.infinity,height: MediaQuery.of(context).size.height*0.3,fit: BoxFit.cover,),
           ),
           SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text.rich(
               TextSpan(
                 children: [
                   TextSpan(
                     text: "Love yourself, always.\n ",
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                   TextSpan(
                     text: "Time heals, trust the process.\n ",
                     style: TextStyle(color: Colors.black),
                   ),
                   TextSpan(
                     text: "Chase dreams, not people.\n",
                     style: TextStyle(fontStyle: FontStyle.italic),
                   ),
                   TextSpan(
                     text: "Be kind, spread positivity.\n",
                     style: TextStyle(color: Colors.black),
                   ),
                   TextSpan(
                     text: "Embrace change, embrace growth.\n",
                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                   ),
                 ],
               ),
             ),
           ),
         ],
      )),
    );
  }
}
