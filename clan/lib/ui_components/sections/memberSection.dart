import 'package:flutter/material.dart';
import 'package:clan/models/clan_model.dart';
import 'package:clan/ui_components/text_widgets.dart';
import 'package:clan/ui_components/cards/memberCard.dart';

class MemberSection extends StatelessWidget {
  const MemberSection({
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
          PageHeadings(text: 'Clan members'),
          const SizedBox(height: 15),
          SizedBox(
            height: 250,
            child: MemberCard(userClan: userClan),
          ),
          TextButton(
              onPressed: () {},
              child: const Center(
                child: Text(
                  "See more",
                  style: TextStyle(color: Color(0xFFD4D044)),
                ),
              )),
        ],
      ),
    );
  }
}