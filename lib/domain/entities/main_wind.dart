import 'package:json_annotation/json_annotation.dart';

part 'main_wind.g.dart';

/*
Класс MainWind.
Преобразование из json в объект MainWind.
 */
@JsonSerializable()
class MainWind {
  final double speed;

  MainWind({
    required this.speed,
  });

  factory MainWind.fromJson(Map<String, dynamic> json) =>
      _$MainWindFromJson(json);
}
