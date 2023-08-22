import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onPressed;

  const BlogCard({required this.title, required this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.4,
        child: Card(
          elevation: 1,
          shadowColor: Colors.grey.shade200,
          child: Column(
            children: [
              Image.asset(image, height: MediaQuery.of(context).size.height*0.3, width: double.infinity, fit: BoxFit.cover,),
              SizedBox(height: 5,),
              Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),)

            ],
          ),
        )
      ),
    );
  }
}

