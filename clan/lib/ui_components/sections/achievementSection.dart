import 'package:flutter/material.dart';
import 'package:clan/models/clan_model.dart';
import 'package:clan/ui_components/text_widgets.dart';

class AchievementSection extends StatelessWidget {
  const AchievementSection({
    Key? key,
    required this.userClan,
  }) : super(key: key);

  final Clan? userClan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeadings(text: 'Achievement'),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Current League",
                style: TextStyle(
                  color: Color(0xFFB45A5A),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(right: 50),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/' + userClan!.league! + ' league.png'),
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text(
                  "League Ranking",
                  style: TextStyle(
                    color: Color(0xFFB45A5A),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  userClan!.rank!.toString() + 'th',
                  style: const TextStyle(
                    color: Color(0xFFD4D044),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text(
                  "Experience",
                  style: TextStyle(
                    color: Color(0xFFB45A5A),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  userClan!.xp!.toString() + ' xp',
                  style: const TextStyle(
                    color: Color(0xFFD4D044),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text(
                  "# of wins",
                  style: TextStyle(
                    color: Color(0xFFB45A5A),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  userClan!.wins!.toString(),
                  style: const TextStyle(
                    color: Color(0xFFD4D044),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}