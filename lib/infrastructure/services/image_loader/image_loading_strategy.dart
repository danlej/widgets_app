import 'package:flutter/material.dart';

abstract class ImageLoadingStrategy {
  Future<Image> loadImage(String path);
}
