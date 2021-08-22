import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final String imgUrl;
  final String name;

  const ImageDetailPage({Key? key, required this.imgUrl, required this.name}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xffDBAC9A),
          title: Text(name),
        ),
        body: SafeArea(
          child: InteractiveViewer(
            child: Center(
              child: Image.asset(imgUrl),
            ),
          ),
        ),
      ),
    );
  }
}
