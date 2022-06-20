import 'user_model.dart';

class Clan {

  String? name;
  String? banner;
  String? league;
  int? rank;
  int? xp;
  int? wins;
  List<User>? members;

  Clan({ this.name, this.banner, this.league, this.rank, this.wins, this.xp, this.members });
}