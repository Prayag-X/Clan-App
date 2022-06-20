import 'dart:math';
import 'package:flutter/material.dart';
import 'package:clan/models/discussion_model.dart';

class DiscussionCard extends StatelessWidget {
  const DiscussionCard({
    Key? key,
    required this.discussion,
  }) : super(key: key);

  final List<Discussion>? discussion;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: min(3, discussion!.length),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discussion![discussion!.length - index - 1].live_status!
                        ? '(live) ' +
                            discussion![discussion!.length - index - 1].heading!
                        : discussion![discussion!.length - index - 1].heading!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFC96464),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    discussion![discussion!.length - index - 1]
                            .unread_messages!
                            .toString() +
                        " unread messages",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
