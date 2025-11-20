import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final Map<String, List<String>>? errors;

  ApiErrorModel({this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Get all error messages combined into a single string
  String getAllErrorMessages({bool withFieldNames = false}) {
    if (errors == null || errors!.isEmpty) {
      return message?.tr() ?? 'Unknown error occurred'.tr();
    }

    return errors!.entries.map((entry) {
      final field = entry.key;
      final messages = entry.value.join(', ');
      return "${withFieldNames ? "${field.tr()} : " : ''}$messages";
    }).join('\n');
  }

  /// Get first error message (optional helper)
  String get firstErrorMessage {
    if (errors != null && errors!.isNotEmpty) {
      return errors!.values.first.first;
    }
    return message ?? 'Unknown error';
  }
}
