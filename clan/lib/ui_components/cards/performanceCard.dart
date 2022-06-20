import 'dart:math';
import 'package:flutter/material.dart';
import 'package:clan/models/performance_model.dart';

class PerformanceCard extends StatelessWidget {
  const PerformanceCard({
    Key? key,
    required this.performance,
  }) : super(key: key);

  final List<Performance>? performance;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: min(2, performance!.length),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(performance![index].image!),
                      fit: BoxFit.cover,
                    )),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      performance![index].heading!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFC96464),
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
