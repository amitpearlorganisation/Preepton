import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const MyButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// class MyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       body: Column(
//         children: [
//           Text('Horizontal Scrollable List of Buttons'),
//           SizedBox(height: 10),
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 5,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5),
//                   child: MyButton(
//                     title: 'Button $index',
//                     onPressed: () {
//                       print('Button $index pressed');
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
