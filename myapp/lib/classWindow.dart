import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/classHistory.dart';
part 'classWindow.g.dart';

@JsonSerializable(explicitToJson: true)
class Window1 {

  History history;
  String location;
  String status;
  String temperature;

  Window1(this.history, this.location, this.status, this.temperature);

  factory Window1.fromJson(Map<String, dynamic> json) => _$Window1FromJson(json);
  Map<String, dynamic> toJson() => _$Window1ToJson(this);
}

@JsonSerializable(explicitToJson: true)
class uid {

  Window1 window1;

  uid(this.window1);

  factory uid.fromJson(Map<String, dynamic> json) => _$uidFromJson(json);
  Map<String, dynamic> toJson() => _$uidToJson(this);

}