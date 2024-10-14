// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDataModel _$ImageDataModelFromJson(Map<String, dynamic> json) =>
    ImageDataModel(
      filename: json['filename'] as String,
      contentType: json['content_type'] as String,
      size: (json['size'] as num).toInt(),
      imageData: json['image_data'] as String?,
    );

Map<String, dynamic> _$ImageDataModelToJson(ImageDataModel instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'content_type': instance.contentType,
      'size': instance.size,
      'image_data': instance.imageData,
    };
