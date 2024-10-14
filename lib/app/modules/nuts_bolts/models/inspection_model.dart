import 'package:inspecly/app/modules/nuts_bolts/models/image_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inspection_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class InspectionModel {
  late final String id;
  late final ImageDataModel? originalImage;
  late final ImageDataModel? processedImage;
  late final int inspectionStatus;
  late final int totalNuts;
  late final int alignedNuts;
  late final int misalignedNuts;
  late final int nonMarkedNuts;
  late final String created;
  late final String updated;
  
  InspectionModel({
    required this.id,
    required this.originalImage,
    required this.processedImage,
    required this.inspectionStatus,
    required this.totalNuts,
    required this.alignedNuts,
    required this.misalignedNuts,
    required this.nonMarkedNuts,
    required this.created,
    required this.updated,
  });

  factory InspectionModel.fromJson(Map<String, dynamic> json) => _$InspectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionModelToJson(this);
}
