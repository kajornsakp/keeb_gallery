import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keeb_gallery/utils/utils.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Container(
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
          ),
        ),
      ),
    );
  }
}

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 56,
        ),
        Text(
          "BeamZaMak",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Image.asset(
          'assets/icon/setting.png',
          height: 16,
        ),
        SizedBox(
          height: 12,
        ),
        Text("Hi, Everyone. I'm a keebs lover"),
        Text("let's find something yours!"),
        SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Gallery",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Icon(Icons.circle, size: 6)
              ],
            ),
            Column(
              children: [
                Text(
                  "Saved",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7)),
                ),
                SizedBox(height: 4),
                // Icon(Icons.circle, size: 6, color: Colors.black.withOpacity(0.7),)
              ],
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: getGalleryModels().length,
          itemBuilder: (BuildContext context, int index) {
            var model = getGalleryModels()[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                  child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(model.imgUrl), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.black.withOpacity(0.6)
                      ]))),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        model.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )),
            );
          },
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        )
      ],
    );
  }
}
