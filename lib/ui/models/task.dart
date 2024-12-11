import 'package:hive/hive.dart';

part 'task.g.dart';
@HiveType(typeId: 1)
class Task extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  final String date;

  Task({
    required this.title,
    required this.description,
    required this.date,
  });
}