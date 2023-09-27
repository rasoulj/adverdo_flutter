import 'dart:io';

import 'package:advedro/core/data/types/json.dart';
import 'package:advedro/core/utils/utils.dart';
import 'package:flutter/material.dart';

double _abs(a) => a < 0 ? -a : a;

class ImageSize {
  final int width;
  final int height;

  ImageSize(this.width, this.height);

  @override
  String toString() => "[$width:$height]";

  static int _gcd(int x, int y) {
    while( y > 0) {
      final r = x % y;
      x = y;
      y = r;
    }
    return x;
  }

  ImageSize get ratio {
    int bmm = _gcd(width, height);
    return ImageSize(width ~/ bmm, height ~/ bmm);
  }

  @override
  bool operator ==(Object other) {
    if(other is! ImageSize) {
      return false;
    }
    double otherRatio = other.width / other.height, thisRatio = width / height;
    return _abs(otherRatio - thisRatio) < 0.01;
  }

  @override
  int get hashCode => width*height*width*height;

}

class ImageMetaInfo {
  final int length;
  final ImageSize size;

  ImageMetaInfo({required this.size, required this.length});

  static Future<ImageMetaInfo> fromFile(File file) async {
    var bytes = file.readAsBytesSync();
    var dec = await decodeImageFromList(bytes);
    return ImageMetaInfo(
      size: ImageSize(dec.width, dec.height),
      length: bytes.lengthInBytes,
    );
  }

}


class ImageInfoRule {
  final List<ImageSize> validSizes;
  final List<ImageSize> validRatios;
  final int? minLength;
  final int? maxLength;

  ImageInfoRule({
    this.validSizes = const [],
    this.validRatios = const [],
    this.maxLength,
    this.minLength,
  });

  //TODO:
  factory ImageInfoRule.fromJson(Json json) => ImageInfoRule();

  bool _matchLength(ImageMetaInfo info) {
    int len = info.length;
    bool ret = true;
    if (minLength != null) {
      ret = ret && len >= minLength!;
    }

    if (maxLength != null) {
      ret = ret && len <= maxLength!;
    }

    return ret;
  }

  bool _matchSizes(ImageMetaInfo info) => validSizes.isEmpty || validSizes.any((e) => info.size == e);

  bool _matchRatio(ImageMetaInfo info) {
    final ratio = info.size.ratio;
    return validRatios.isEmpty || validRatios.any((e) => ratio == e.ratio);
  }

  bool match(ImageMetaInfo info) => _matchLength(info) && _matchRatio(info) && _matchSizes(info);

  List<String> _getLengthError(ImageMetaInfo info) {
    int len = info.length;
    List<String> ret = [];
    if (minLength != null) {
      if (len < minLength!) {
        ret.add("The File size $len bytes is less that expected minimum $minLength bytes");
      }
    }

    if (maxLength != null) {
      if (len > maxLength!) {
        ret.add("The File size $len bytes is greater that expected maximum $maxLength bytes");
      }
    }

    return ret;
  }

  List<String> _getDimensionErrors(ImageMetaInfo info) =>
      [
        if(!_matchSizes(info)) "The image dimension ${info.size} do not match any of valid Dimension(s): ${validSizes.joinAnd()}",
      ];

  List<String> _getRatioErrors(ImageMetaInfo info) =>
      [
        if(!_matchRatio(info)) "The image ratio ${info.size.ratio} do not match any of valid Ratio(s): ${validRatios.map((e) => e.ratio).joinAnd()}",
      ];

  List<String> getErrors(ImageMetaInfo info) =>
      [
        ..._getLengthError(info),
        ..._getRatioErrors(info),
        ..._getDimensionErrors(info),
      ];

}