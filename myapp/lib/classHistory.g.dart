// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['Status'] as String,
    json['Temperature'] as String,
    json['Weather'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'Status': instance.Status,
      'Temperature': instance.Temperature,
      'Weather': instance.Weather,
    };

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
    json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'address': instance.address?.toJson(),
    };
