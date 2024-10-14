import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspecly/app/modules/nuts_bolts/controllers/nuts_inspection_controller.dart';
import 'package:inspecly/app/modules/utils/custom_shimmer_container_box.dart';
import 'package:inspecly/app/modules/utils/size_config.dart';


class InspectionScreen extends StatelessWidget {
  final String selectedImagePath;
  InspectionScreen({required this.selectedImagePath});
  final nutsController = Get.find<NutsInspectionController>();

  @override
  Widget build(BuildContext context) {
    if (nutsController.imageProcessing.value){
      nutsController.uploadImage(selectedImagePath);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspection Result", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Original Image', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Image.file(File(selectedImagePath),
              width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 10),

          const Text('Processed Image', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Obx(() => nutsController.imageProcessing.value
              ? CustomShimmerContainerBox(
                  height: getProportionateScreenHeight(250))
              : Image.memory(
                  const Base64Decoder()
                      .convert(nutsController.imageBytes.value),
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 10),

          const Text("Inspection Analysis", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          Obx(() => nutsController.imageProcessing.value?
          CustomShimmerContainerBox(height: getProportionateScreenHeight(100)):
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Total Detected Nuts: ${nutsController.inspectionResult!.totalNuts}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Aligned Nuts: ${nutsController.inspectionResult!.alignedNuts}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Misaligned Nuts: ${nutsController.inspectionResult!.misalignedNuts}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Non-Marked Nuts: ${nutsController.inspectionResult!.nonMarkedNuts}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )),

        SizedBox(height: getProportionateScreenHeight(50)),
        ],
      )
    );
  }
}
