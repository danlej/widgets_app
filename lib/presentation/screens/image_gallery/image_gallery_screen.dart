import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/infrastructure/services/image_loader/image_loader.dart';

final images = <String>[
  'assets/images/garage.jpg',
  'https://images.pexels.com/photos/25810976/pexels-photo-25810976/free-photo-of-healthy-breakfast-with-beverages.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  '/storage/emulated/0/Download/flowers-and-te.jpg',
  'assets/images/quebec-city.jpg',
];

class ImageGalleryScreen extends StatelessWidget {
  static const String name = 'image-gallery';

  const ImageGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          ImageViewer(imagePath: images[0], behavior: Behavior.imageAssetStrategy),
          ImageViewer(imagePath: images[1], behavior: Behavior.imageNetworkStrategy),
          ImageViewer(imagePath: images[2], behavior: Behavior.imageFileStrategy),
          ImageViewer(imagePath: images[3], behavior: Behavior.imageMemoryStrategy),
        ],
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final String imagePath;
  final Behavior behavior;

  const ImageViewer({
    super.key,
    required this.imagePath,
    required this.behavior,
  });

  @override
  Widget build(BuildContext context) {
    final ImageLoader imageLoader = ImageLoader();

    return FutureBuilder(
      future: imageLoader.loadImage(imagePath, behavior),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) return Image.asset('assets/images/no_image_available.jpg');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            return ImageViewerFrame(image: snapshot.data!);
        }
      },
    );
  }
}

class ImageViewerFrame extends StatelessWidget {
  final Image image;

  const ImageViewerFrame({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showImageDialog(context, image),
      child: Container(
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
        child: image,
      ),
    );
  }

  void showImageDialog(BuildContext context, Image image) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Stack(
          children: [
            // Blur effect in the background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Ajusta el nivel de desenfoque
              child: Container(
                color: Colors.black.withAlpha(128), // Un ligero fondo semitransparente
              ),
            ),
            // Image
            Center(
              child: Dialog(
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: image,
                      ),
                      Positioned(
                        top: 1,
                        right: 1,
                        child: IconButton(
                          onPressed: () => context.pop(),
                          color: Colors.white,
                          icon: const Icon(
                            Icons.close_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
