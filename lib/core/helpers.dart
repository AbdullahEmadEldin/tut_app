import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/core/assets_paths.dart';

class Helper {
  /// This method convert the selected image to MultipartFile
  /// which the acceptable format to be sent to the server
  static Future<MultipartFile> uploadImageToApi(XFile? image) async {
    // if the user didn't select an image we will use the default avatar as his profile pic.
    if (image == null) {
      final ByteData byteData = await rootBundle.load(ImagesAssets.avatar);
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
}
