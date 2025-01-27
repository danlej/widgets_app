import 'package:flutter/material.dart';
import 'package:widgets_app/infrastructure/services/image_loader/iloader.dart';

class ImageAssetStrategy extends ILoader {
  @override
  Image loadImage(String path) {
    return Image.asset(
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
    );
  }
}
