// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionModel _$InspectionModelFromJson(Map<String, dynamic> json) =>
    InspectionModel(
      id: json['id'] as String,
      originalImage: json['original_image'] == null
          ? null
          : ImageDataModel.fromJson(
              json['original_image'] as Map<String, dynamic>),
      processedImage: json['processed_image'] == null
          ? null
          : ImageDataModel.fromJson(
              json['processed_image'] as Map<String, dynamic>),
      inspectionStatus: (json['inspection_status'] as num).toInt(),
      totalNuts: (json['total_nuts'] as num).toInt(),
      alignedNuts: (json['aligned_nuts'] as num).toInt(),
      misalignedNuts: (json['misaligned_nuts'] as num).toInt(),
      nonMarkedNuts: (json['non_marked_nuts'] as num).toInt(),
      created: json['created'] as String,
      updated: json['updated'] as String,
    );

Map<String, dynamic> _$InspectionModelToJson(InspectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_image': instance.originalImage?.toJson(),
      'processed_image': instance.processedImage?.toJson(),
      'inspection_status': instance.inspectionStatus,
      'total_nuts': instance.totalNuts,
      'aligned_nuts': instance.alignedNuts,
      'misaligned_nuts': instance.misalignedNuts,
      'non_marked_nuts': instance.nonMarkedNuts,
      'created': instance.created,
      'updated': instance.updated,
    };
