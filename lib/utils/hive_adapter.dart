import 'package:hive/hive.dart';

part 'hive_adapter.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;

  Movie({required this.id});
}
