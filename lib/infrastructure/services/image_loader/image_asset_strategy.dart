import 'package:flutter/material.dart';
import 'package:widgets_app/infrastructure/services/image_loader/image_loading_strategy.dart';

class ImageAssetStrategy implements ImageLoadingStrategy {
  @override
  Future<Image> loadImage(String path) {
    return Future.value(
      Image.asset(
        path,
        fit: BoxFit.cover,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;

          return frame == null
              ? const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : child;
        },
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/no_image_available.jpg',
          );
        },
      ),
    );
  }
}
