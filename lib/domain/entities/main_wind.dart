import 'package:json_annotation/json_annotation.dart';

part 'main_wind.g.dart';

/*
Класс `MainWind` содержит данные ветра (скорость).
Преобразование из json в объект `MainWind`.

Class `MainWind` contains data of wind (speed).
Making `MainWind` object from json.
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
