// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classWindow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Window1 _$Window1FromJson(Map<String, dynamic> json) {
  return Window1(
    json['history'] == null
        ? null
        : History.fromJson(json['history'] as Map<String, dynamic>),
    json['location'] as String,
    json['status'] as String,
    json['temperature'] as String,
  );
}

Map<String, dynamic> _$Window1ToJson(Window1 instance) => <String, dynamic>{
      'history': instance.history?.toJson(),
      'location': instance.location,
      'status': instance.status,
      'temperature': instance.temperature,
    };

uid _$uidFromJson(Map<String, dynamic> json) {
  return uid(
    json['window1'] == null
        ? null
        : Window1.fromJson(json['window1'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$uidToJson(uid instance) => <String, dynamic>{
      'window1': instance.window1?.toJson(),
    };
