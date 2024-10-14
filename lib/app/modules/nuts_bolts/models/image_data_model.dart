import 'package:json_annotation/json_annotation.dart';

part 'image_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ImageDataModel {
  late final String filename;
  late final String contentType;
  late final int size;
  late final String? imageData;
  
  ImageDataModel({
    required this.filename,
    required this.contentType,
    required this.size,
    required this.imageData,
  });

  factory ImageDataModel.fromJson(Map<String, dynamic> json) => _$ImageDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataModelToJson(this);
}
