import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspecly/app/modules/nuts_bolts/controllers/nuts_inspection_controller.dart';
import 'package:inspecly/app/modules/nuts_bolts/views/inspection_screen.dart';
import 'package:inspecly/app/modules/utils/custom_logger.dart';

class HomeController extends GetxController {
  final NutsInspectionController nutsController = Get.put(NutsInspectionController());
  final ImagePicker _imagePicker = ImagePicker();
  var selectedImagePath = "";

  Future<void> pickImage(imageSource) async {
    logger.i("Starting fetch near by stores from stores controller");
    String errorMessage = "";

    try {
      final pickedImage = await _imagePicker.pickImage(source: imageSource);

      if (pickedImage != null) {
        selectedImagePath = pickedImage.path;
      } else {
        errorMessage = "No Image Selected";
      }
    } on Exception catch (e) {
      errorMessage = "Exception occurred while uploading image in inspection controller";
      logger.e("$errorMessage: $e");
    } finally {
      if (errorMessage.isNotEmpty) {
        logger.i("Error!: $errorMessage");
        Get.snackbar("Image Not Picked", "Please pick the image again");
      } else {
        nutsController.imageProcessing.value = true;
        Get.to(InspectionScreen(selectedImagePath: selectedImagePath));
      }
    }
  }
}
