import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspecly/app/modules/nuts_bolts/controllers/nuts_inspection_controller.dart';
import 'package:inspecly/app/modules/nuts_bolts/views/inspection_screen.dart';
import 'package:inspecly/app/modules/utils/custom_logger.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;


class HomeController extends GetxController {
  final NutsInspectionController nutsController = Get.put(NutsInspectionController());
  final ImagePicker _imagePicker = ImagePicker();
  var selectedImagePath = "";

  Future<void> pickImage(imageSource) async {
    logger.i("Starting fetch near by stores from stores controller");
    String errorMessage = "";
    List<String> allowedExtensions = ['.jpg', '.jpeg', '.png'];

    try {
      final pickedImage = await _imagePicker.pickImage(source: imageSource);

      if (pickedImage != null) {
        var fileExtension = path.extension(pickedImage.path).toLowerCase();
        var mimeType = lookupMimeType(pickedImage.path);
        if(mimeType != null && mimeType.isNotEmpty && allowedExtensions.contains(fileExtension)){
          selectedImagePath = pickedImage.path;
        } else {
          errorMessage = "Only supports image formats: ${allowedExtensions.join('/')}";
        }
      } else {
        errorMessage = "No Image Selected";
      }
    } on Exception catch (e) {
      errorMessage = "Exception occurred while uploading image";
      logger.e("$errorMessage: $e");
    } finally {
      if (errorMessage.isNotEmpty) {
        logger.i("Error!: $errorMessage");
        Get.snackbar("Error!: $errorMessage", "Please pick the image again", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.deepPurpleAccent.shade200, colorText: Colors.white);
      } else {
        nutsController.imageProcessing.value = true;
        Get.to(() =>InspectionScreen(selectedImagePath: selectedImagePath));
      }
    }
  }
}
