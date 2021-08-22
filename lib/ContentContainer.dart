import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keeb_gallery/ImageDetailPage.dart';
import 'package:keeb_gallery/utils/utils.dart';

class ContentContainer extends StatefulWidget {
  const ContentContainer({Key? key}) : super(key: key);

  @override
  _ContentContainerState createState() => _ContentContainerState();
}

enum Mode { gallery, saved }

class _ContentContainerState extends State<ContentContainer> {
  List<Gallery> savedItem = [];
  Mode selectedMode = Mode.gallery;

  void _didSaveGallery(Gallery gallery) {
    setState(() {
      savedItem.add(gallery);
    });
  }

  void _removeFromSavedItem(Gallery gallery) {
    setState(() {
      savedItem.remove(gallery);
    });
  }

  void _didTapSavedTab() {
    setState(() {
      selectedMode = Mode.saved;
    });
  }

  void _didTapGalleryTab() {
    setState(() {
      selectedMode = Mode.gallery;
    });
  }

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
            Material(
              child: InkWell(
                onTap: _didTapGalleryTab,
                child: Column(
                  children: [
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedMode == Mode.gallery
                              ? Colors.black
                              : Colors.black.withOpacity(0.7)),
                    ),
                    SizedBox(height: 4),
                    Visibility(
                        visible: selectedMode == Mode.gallery,
                        child: Icon(Icons.circle, size: 6))
                  ],
                ),
              ),
            ),
            Material(
              child: InkWell(
                onTap: _didTapSavedTab,
                child: Column(
                  children: [
                    Text(
                      "Saved ${savedItem.isNotEmpty ? "(${savedItem.length})" : ""}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedMode == Mode.saved
                              ? Colors.black
                              : Colors.black.withOpacity(0.7)),
                    ),
                    SizedBox(height: 4),
                    Visibility(
                        visible: selectedMode == Mode.saved,
                        child: Icon(Icons.circle, size: 6))
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Visibility(
          visible: selectedMode == Mode.gallery,
            child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: getGalleryModels().length,
          itemBuilder: (BuildContext context, int index) {
            var model = getGalleryModels()[index];
            return GestureDetector(
              onLongPress: () {
                _didSaveGallery(model);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${model.name}  saved"),
                ));
              },
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return ImageDetailPage(
                    imgUrl: model.imgUrl,
                    name: model.name,
                  );
                }));
              },
              child: ClipRRect(
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
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        )
        ),
        Visibility(
            visible: selectedMode == Mode.saved,
            child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 1,
              itemCount: savedItem.length,
              itemBuilder: (BuildContext context, int index) {
                var model = savedItem[index];
                return GestureDetector(
                  onLongPress: () {
                    _removeFromSavedItem(model);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("${model.name}  removed"),
                    ));
                  },
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute<void>(builder: (BuildContext context) {
                          return ImageDetailPage(
                            imgUrl: model.imgUrl,
                            name: model.name,
                          );
                        }));
                  },
                  child: ClipRRect(
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
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2,1),
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            )
        )
      ],
    );
  }
}
