import 'package:flutter/material.dart';
import 'package:clan/models/clan_model.dart';

class ClanBannerSection extends StatelessWidget {
  const ClanBannerSection({
    Key? key,
    required this.userClan,
  }) : super(key: key);

  final Clan? userClan;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 360,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.yellow),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          image: DecorationImage(
            image: AssetImage(userClan!.banner!),
            fit: BoxFit.cover,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 360,
            height: 120,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius:
              const BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Clan name: " + userClan!.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userClan!.members!.length.toString() +
                      " members, 2 online",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}