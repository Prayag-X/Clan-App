import 'dart:math';
import 'package:flutter/material.dart';
import 'package:clan/models/clan_model.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.userClan,
  }) : super(key: key);

  final Clan? userClan;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: min(3, userClan!.members!.length),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage(userClan!.members![index].profile_image!),
                    radius: 30.0,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      userClan!.members![index].name! +
                          ' - ' +
                          userClan!.members![index].position!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xFFC96464),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
