import 'package:flutter/material.dart';
import 'package:widgets_app/infrastructure/services/image_loader/image_loading_strategy.dart';

class ImageLoader {
  //ImageLoadingStrategy imageLoadingStrategy;
  final Map<String, ImageLoadingStrategy> _strategies = {};

  void registerStrategy(String key, ImageLoadingStrategy strategy) {
    _strategies[key] = strategy;
  }

  Future<Image> loadImage(String key, String path) {
    final strategy = _strategies[key];

    if (strategy == null) {
      return throw Exception('Estrategia no registrada para la clave: $key');
    }

    return strategy.loadImage(path);
  }
}

// enum KeyStrategy {
//   asset,
//   network,
//   file,
//   memory,
// }
