import 'package:hive/hive.dart';
part 'userhive.g.dart';

@HiveType(typeId: 0)
class UserHive {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String url;
  UserHive(this.name, this.url);
}
