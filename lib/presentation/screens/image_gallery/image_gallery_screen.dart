import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/infrastructure/services/image_loader/image_loader.dart';
import 'package:widgets_app/infrastructure/services/image_loader/strategy.dart';

final List<Map<String, String>> images = [
  {
    'type': 'asset',
    'source': 'assets/images/garage.jpg',
  },
  {
    'type': 'network',
    'source':
        'https://images.pexels.com/photos/25810976/pexels-photo-25810976/free-photo-of-healthy-breakfast-with-beverages.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  },
  {
    'type': 'file',
    'source': '/storage/emulated/0/Download/flowers-and-te.jpg',
  },
  {
    'type': 'memory',
    'source': 'assets/images/quebec-city.jpg',
  },
];

class ImageGalleryScreen extends StatelessWidget {
  final ImageLoader _imageLoader = ImageLoader();

  static const String name = 'image-gallery';

  ImageGalleryScreen({super.key}) {
    _imageLoader.registerStrategy('asset', AssetImageStrategy());
    _imageLoader.registerStrategy('network', NetworkImageStrategy());
    _imageLoader.registerStrategy('file', FileImageStrategy());
    _imageLoader.registerStrategy('memory', MemoryImageStrategy());
  }

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
          ImageViewer(
            imageLoader: _imageLoader,
            strategy: images[0]['type']!,
            source: images[0]['source']!,
          ),
          ImageViewer(
            imageLoader: _imageLoader,
            strategy: images[1]['type']!,
            source: images[1]['source']!,
          ),
          ImageViewer(
            imageLoader: _imageLoader,
            strategy: images[2]['type']!,
            source: images[2]['source']!,
          ),
          ImageViewer(
            imageLoader: _imageLoader,
            strategy: images[3]['type']!,
            source: images[3]['source']!,
          ),
        ],
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final ImageLoader imageLoader;
  final String strategy;
  final String source;

  const ImageViewer({
    super.key,
    required this.imageLoader,
    required this.strategy,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imageLoader.loadImage(strategy, source),
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
