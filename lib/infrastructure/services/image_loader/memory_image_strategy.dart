import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_app/infrastructure/services/image_loader/image_loading_strategy.dart';

class MemoryImageStrategy implements ImageLoadingStrategy {
  @override
  Future<Image> loadImage(String path) async {
    try {
      ByteData byteData = await rootBundle.load(path);

      Uint8List rawImage = byteData.buffer.asUint8List();

      return Image.memory(
        rawImage,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;

          return frame == null
              ? const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : child;
        },
      );
    } catch (e) {
      return Image.asset('assets/images/no_image_available.jpg');
    }
  }
}
