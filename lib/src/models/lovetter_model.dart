// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:belohvims_web/src/models/image_with_description_model.dart';


part 'lovetter_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class LovetterModel {
  String lovetterId;
  String userId;
  String? recipientId;
  String? shareToken;
  String lovetterName;
  String from;
  String to;
  String text;
  String lovetterPassword;
  String lovetterPasswordHint;
  DateTime? specialDate;
  DateTime? letterCreationDate;
  List<ImageWithDescriptionModel>? images;
  String? audioUrl;
  bool isItPaid;

  LovetterModel({
    required this.lovetterId,
    required this.userId,
    this.recipientId,
    this.shareToken,
    this.lovetterName = '',
    required this.from,
    required this.to,
    required this.text,
    this.lovetterPassword = '',
    this.lovetterPasswordHint = '',
    this.specialDate,
    this.letterCreationDate,
    this.images,
    this.isItPaid = false,
    this.audioUrl,
  });

  factory LovetterModel.fromJson(Map<String, dynamic> json) =>
      _$LovetterModelFromJson(json);

  Map<String, dynamic> toJson() => _$LovetterModelToJson(this);
}
