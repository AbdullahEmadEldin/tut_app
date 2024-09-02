import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tut_app/constants/assets_paths.dart';
import 'package:tut_app/core/services/networking/dio_comsumer.dart';
import 'package:tut_app/shared/view/widgets/toast_message.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkHelper {
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
      return MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
  }

  /// This method is used to launch the url in external website or app
  static Future<void> customLaunchUrl(
    BuildContext context, {
    required String url,
  }) async {
    Uri uri = Uri.parse(url);

    /// before launching the url, give permission of internet access in Android Manifest file.
    bool canLaunch = await canLaunchUrl(uri);
    try {
      if (canLaunch) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        showToast(context, 'Could not launch url', isError: true);
      }
    } on Exception catch (e) {
      showToast(context, e.toString(), isError: true);
    }
  }

  /// This method to convert the image from it's URL to Uint8List to store it as BLOB in SQLite database.
  ///
  static Future<Uint8List> covertImageToBytes(String imageUrl) async {
    final response = await DioConsumer().get(
        path: imageUrl, options: Options(responseType: ResponseType.bytes));
    print(
        '============================>>>> Convert image ======= ${response.runtimeType}');
    return response; // This returns the image as Uint8List
  }
}
