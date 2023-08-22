import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peerp_toon/presentation/screens/productScreen/widgets/blogCard.dart';
import 'package:peerp_toon/presentation/screens/productScreen/widgets/blogDescription.dart';
import 'package:peerp_toon/presentation/screens/productScreen/widgets/buttonWidget.dart';

class Blog extends StatelessWidget {
  Blog({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> blogPosts = [
    {
      'title': 'Blog post 1',
      'image': 'assets/images/logo/logo.png',
      // 'onPressed': () => print('Blog post 1 pressed'),
    },
    {
      'title': 'Blog post 2',
      'image': 'assets/images/shoes/shoes4.jpg',
      // 'onPressed': () => print('Blog post 2 pressed'),
    },
    {
      'title': 'Blog post 3',
      'image': 'assets/images/shoes/shoes1.jpg',
      // 'onPressed': () => print('Blog post 3 pressed'),
    },
    {
      'title': 'Blog post 4',
      'image': 'assets/images/shoes/shoes4.jpg',
      // 'onPressed': () => print('Blog post 4 pressed'),
    },
    {
      'title': 'Blog post 5',
      'image': 'assets/images/shoes/shoes2.jpg',
      // 'onPressed': () => print('Blog post 5 pressed'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: MyButton(
                        title: 'Button $index',
                        onPressed: () {
                          print('Button $index pressed');
                        },
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: blogPosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final blogPost = blogPosts[index];
                      return BlogCard(
                        title: blogPost['title'],
                        image: blogPost['image'],
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BlogDescriptionScreen(title: blogPost["title"],
                              imageUrl: blogPost["image"],
                            )),
                          );

                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
