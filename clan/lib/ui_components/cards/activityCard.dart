import 'dart:math';
import 'package:flutter/material.dart';
import 'package:clan/models/activities_model.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final List<Activity>? activity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: min(2, activity!.length),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 120,
              width: 400,
              margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(activity![index].image!),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 55.0, vertical: 10),
                  child: Text(
                    activity![index].heading!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
