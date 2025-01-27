import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/infrastructure/services/image_loader/image_loader.dart';

final images = <String>[
  'assets/images/garage.jpg',
  'https://images.pexels.com/photos/25810976/pexels-photo-25810976/free-photo-of-healthy-breakfast-with-beverages.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  '/storage/emulated/0/Download/flowers-and-te.jpg',
];

class ImageGalleryScreen extends StatelessWidget {
  static const String name = 'image-gallery';

  const ImageGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImageLoader imageLoader = ImageLoader();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: [
          GestureDetector(
            onTap: () => showImageDialog(context, images[0], Behavior.imageAssetStrategy),
            child: ImageViewer(image: imageLoader.loadImage(images[0], Behavior.imageAssetStrategy)),
          ),
          GestureDetector(
            onTap: () => showImageDialog(context, images[1], Behavior.imageNetworkStrategy),
            child: ImageViewer(image: imageLoader.loadImage(images[1], Behavior.imageNetworkStrategy)),
          ),
          GestureDetector(
            onTap: () => showImageDialog(context, images[2], Behavior.imageFileStrategy),
            child: ImageViewer(image: imageLoader.loadImage(images[2], Behavior.imageFileStrategy)),
          ),
          GestureDetector(
            onTap: () {},
            child: const Placeholder(),
          ),
        ],
      ),
    );
  }

  void showImageDialog(BuildContext context, String imagePath, Behavior behaivor) {
    ImageLoader imageLoader = ImageLoader();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
          child: ClipRRect(
              // borderRadius: BorderRadius.circular(20),
              child: Stack(
            children: [
              imageLoader.loadImage(imagePath, behaivor),
              Positioned(
                  top: 1,
                  right: 1,
                  child: IconButton(
                      onPressed: () => context.pop(),
                      color: Colors.white,
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 30,
                      ))),
            ],
          )),
        );
      },
    );
  }
}

class ImageViewer extends StatelessWidget {
  final Image image;

  const ImageViewer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.white70),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: image);
  }
}
