import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/core/assets_paths.dart';

class Helper {
  /// This method convert the selected image to MultipartFile
  /// which the acceptable format to be sent to the server
  static Future<MultipartFile> uploadImageToApi(XFile? image) async {
    // if the user didn't select an image we will use the default avatar as his profile pic.
    if (image == null) {
      final ByteData byteData = await rootBundle.load(AppAssets.images.avatar);
      final Uint8List imageData = byteData.buffer.asUint8List();

      final MultipartFile multipartFile = MultipartFile.fromBytes(
        imageData,
        filename: 'avatar.jpg',
        // contentType: MediaType('image', 'jpg'),
      );
      return multipartFile;
    } else
      return MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);
  }

//*========================== IMP Explanation ========================== *//
  /// This method to calculate the responsive dimension of a widget
  /// according to the screen size and the device pixel ratio
  /// it could be used with determining width or height and Widget or text.
//! Why not using MediaQuery ??????????
//? ===>> As in multiple cases the the widget size to the device pixel ratio will be too small or too large.
//? So we have to calculate the scale factor and limit it with max and min values.
//? STEPS:
//! 1- Determine a break point for each platform
  ///   ======>>> It's determined by approximation according to width only not height. <<<<=======.
  ///   On this BP the base dimension will set.
  ///   Under this BP the base dimension will be multiplied by the scale factor to decrease it.
  ///   Above this BP the base dimension will be multiplied by the scale factor to increase it.
  /// ?===> And to avoid too small or too large dimension we will limit it with [min] and [max] values.
  //! 2- get Scale Factor //? ==> as BP also there is a Scale Factor for each Platform.
  //?    SF = currentScreenSize(from MediaQuery) / BP.
  //! 2- get Responsive Dimension
  ///?    RD = baseDimension * SF

  static double getResponsiveDimension(
    BuildContext context, {
    required double baseDimension,
  }) {
    // get Scale Factor
    final Size currentSize = MediaQuery.sizeOf(context);
    final scaleFactor = _getScaleFactor(currentSize);
    double responsiveDimension = baseDimension * scaleFactor;
    double upperLimit = baseDimension * 1.1;
    double lowerLimit = baseDimension * 0.8;

    responsiveDimension = responsiveDimension.clamp(lowerLimit, upperLimit);
    return responsiveDimension;
  }

  static double _getScaleFactor(Size currentSize) {
    final width = currentSize.width;
    double scaleFactor;
    if (width < 600) {
      scaleFactor =
          currentSize.width / 400; // approximated breakPoint for mobile
    } else if (width < 900) {
      scaleFactor = currentSize.width / 700;
    } else {
      scaleFactor = currentSize.width / 1000;
    }

    return double.parse(scaleFactor.toStringAsFixed(1));
  }
}
