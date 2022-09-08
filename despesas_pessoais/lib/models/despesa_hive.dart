import 'package:hive/hive.dart';

part 'despesa_hive.g.dart';

@HiveType(typeId: 0)
class Despesa {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double value;

  @HiveField(3)
  DateTime date;

  Despesa(this.id, this.title, this.value, this.date);
}
