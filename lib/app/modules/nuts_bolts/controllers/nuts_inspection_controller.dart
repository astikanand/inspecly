import "dart:convert";
import "package:get/get.dart";
import "package:http/http.dart" as http;
import "package:http_parser/http_parser.dart";
import "package:inspecly/app/config/site_config.dart";
import "package:inspecly/app/modules/nuts_bolts/models/inspection_model.dart";
import "package:inspecly/app/modules/utils/custom_logger.dart";


class NutsInspectionController extends GetxController {
  InspectionModel? inspectionResult;
  var imageBytes = "".obs;
  RxBool imageProcessing = false.obs;
  
  Future<void> uploadImage(String selectedImagePath) async {
    logger.i("Starting to upload image for inspection");
    String errorMessage = "";

    try {
      if (selectedImagePath.isNotEmpty) {
        var apiUrl = "${SiteConfig.apiBaseURL}/inspections/create-inspection";
        var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
        
        request.files.add(
          await http.MultipartFile.fromPath(
            "file", 
            selectedImagePath,
            filename: selectedImagePath.split("/").last,
            contentType: MediaType("image", "png")
        ));

        final response = await request.send();

        if (response.statusCode == 200) {
          var responseData = await response.stream.bytesToString();
          var jsonData = jsonDecode(responseData);
          inspectionResult = InspectionModel.fromJson(jsonData);
        } else {
          errorMessage = "Request not succeeded while uploading image";
        }
      } else {
        errorMessage = "Please select an image first";
      }
    } on Exception catch (e) {
      logger.e("Exception occurred while uploading image in inspection controller: $e");
      errorMessage = "Exception occurred while uploading image in inspection controller";
    } finally {
      imageProcessing.value = false;
      if (errorMessage.isNotEmpty) {
        logger.i("Error!: $errorMessage");
        Get.snackbar("Image Upload Failed", "Error Occurred while Uploading the image");
      } else {
        imageBytes.value = inspectionResult!.processedImage!.imageData!;
        Get.snackbar("Inspection Success", "Inspection Result showing soon");
      }
    }
  }
}
