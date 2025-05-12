// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lovetter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LovetterModel _$LovetterModelFromJson(Map json) => LovetterModel(
      lovetterId: json['lovetterId'] as String,
      userId: json['userId'] as String,
      recipientId: json['recipientId'] as String?,
      shareToken: json['shareToken'] as String?,
      lovetterName: json['lovetterName'] as String? ?? '',
      from: json['from'] as String,
      to: json['to'] as String,
      text: json['text'] as String,
      lovetterPassword: json['lovetterPassword'] as String? ?? '',
      lovetterPasswordHint: json['lovetterPasswordHint'] as String? ?? '',
      specialDate: json['specialDate'] == null
          ? null
          : DateTime.parse(json['specialDate'] as String),
      letterCreationDate: json['letterCreationDate'] == null
          ? null
          : DateTime.parse(json['letterCreationDate'] as String),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageWithDescriptionModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      isItPaid: json['isItPaid'] as bool? ?? false,
      audioUrl: json['audioUrl'] as String?,
    );

Map<String, dynamic> _$LovetterModelToJson(LovetterModel instance) =>
    <String, dynamic>{
      'lovetterId': instance.lovetterId,
      'userId': instance.userId,
      'recipientId': instance.recipientId,
      'shareToken': instance.shareToken,
      'lovetterName': instance.lovetterName,
      'from': instance.from,
      'to': instance.to,
      'text': instance.text,
      'lovetterPassword': instance.lovetterPassword,
      'lovetterPasswordHint': instance.lovetterPasswordHint,
      'specialDate': instance.specialDate?.toIso8601String(),
      'letterCreationDate': instance.letterCreationDate?.toIso8601String(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'audioUrl': instance.audioUrl,
      'isItPaid': instance.isItPaid,
    };
