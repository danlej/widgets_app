import 'package:flutter/material.dart';
import 'package:widgets_app/infrastructure/services/image_loader/iloader.dart';
import 'package:widgets_app/infrastructure/services/image_loader/strategy.dart';

class ImageLoader {
  ILoader loader;

  ImageLoader() : loader = ImageAssetStrategy();

  Image loadImage(String path, Behavior behavior) {
    switch (behavior) {
      case Behavior.imageAssetStrategy:
        loader = ImageAssetStrategy();
        break;
      case Behavior.imageNetworkStrategy:
        loader = ImageNetworkStrategy();
        break;
      case Behavior.imageFileStrategy:
        loader = ImageFileStrategy();
        break;
      case Behavior.imageMemoryStrategy:
        loader = ImageMemoryStrategy();
        break;
    }

    return loader.loadImage(path);
  }
}

enum Behavior {
  imageAssetStrategy,
  imageNetworkStrategy,
  imageFileStrategy,
  imageMemoryStrategy,
}
