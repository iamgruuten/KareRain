import 'package:json_annotation/json_annotation.dart';

part 'classHistory.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  String Status;
  String Temperature;
  String Weather;

  Address(this.Status, this.Temperature, this.Weather);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}


@JsonSerializable(explicitToJson: true)
class History {
  Address address;

  History(this.address);

  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

