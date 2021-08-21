
class Gallery {
  String imgUrl;
  String name;

  Gallery(this.imgUrl, this.name);

  Gallery.name(this.imgUrl, this.name);
}

List<Gallery> getGalleryModels() {
  return [
    Gallery('assets/image/1.jpg', '#Rainbow'),
    Gallery('assets/image/2.jpg', '#DMG'),
    Gallery('assets/image/3.jpg', '#Olivia'),
    Gallery('assets/image/4.jpg', '#bananasplit'),
    Gallery('assets/image/5.jpg', '#dsa'),
    Gallery('assets/image/6.jpg', '#extended'),
    Gallery('assets/image/1.jpg', '#Rainbow'),
    Gallery('assets/image/2.jpg', '#DMG'),
    Gallery('assets/image/3.jpg', '#Olivia'),
    Gallery('assets/image/4.jpg', '#bananasplit'),
    Gallery('assets/image/5.jpg', '#dsa'),
    Gallery('assets/image/6.jpg', '#extended'),
  ];
}