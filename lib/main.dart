import 'package:flutter/material.dart';
import 'package:keeb_gallery/ContentContainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              'assets/icon/menu.png',
              height: 18,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xffDBAC9A),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Container(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                Container(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 120,
                        color: Color(0xffDBAC9A),
                      ),
                      Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                          margin: EdgeInsets.only(top: 60),
                          child: ContentContainer()),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/image/profile.png'),
                      ),
                    ],
                  ),
                )
              ]
            ))
          ],
        ),
      ),
    );
  }
}
