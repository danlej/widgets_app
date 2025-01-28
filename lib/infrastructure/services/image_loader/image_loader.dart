import 'package:flutter/material.dart';
import 'package:widgets_app/infrastructure/services/image_loader/image_loading_strategy.dart';
import 'package:widgets_app/infrastructure/services/image_loader/strategy.dart';

class ImageLoader {
  ImageLoadingStrategy imageLoadingStrategy;

  ImageLoader() : imageLoadingStrategy = ImageAssetStrategy();

  Future<Image> loadImage(String path, Behavior behavior) {
    switch (behavior) {
      case Behavior.imageAssetStrategy:
        imageLoadingStrategy = ImageAssetStrategy();
        break;
      case Behavior.imageNetworkStrategy:
        imageLoadingStrategy = ImageNetworkStrategy();
        break;
      case Behavior.imageFileStrategy:
        imageLoadingStrategy = ImageFileStrategy();
        break;
      case Behavior.imageMemoryStrategy:
        imageLoadingStrategy = ImageMemoryStrategy();
        break;
    }

    return imageLoadingStrategy.loadImage(path);
  }
}

enum Behavior {
  imageAssetStrategy,
  imageNetworkStrategy,
  imageFileStrategy,
  imageMemoryStrategy,
}
