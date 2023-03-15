import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_model.freezed.dart';
part 'number_model.g.dart';

@freezed
class NumberModel with _$NumberModel {
  const factory NumberModel({
    required String name,
    required String image,
  }) = _NumberModel;

  factory NumberModel.fromJson(Map<String, dynamic> json) =>
      _$NumberModelFromJson(json);
}
