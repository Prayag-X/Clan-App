import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:clan/services/database.dart';
import 'package:clan/models/user_model.dart';
import 'package:clan/models/clan_model.dart';
import 'package:clan/models/discussion_model.dart';
import 'package:clan/models/activities_model.dart';
import 'package:clan/models/performance_model.dart';
import 'package:clan/ui_components/loading.dart';
import 'package:clan/ui_components/text_widgets.dart';
import 'package:clan/ui_components/cards/performanceCard.dart';
import 'package:clan/ui_components/cards/activityCard.dart';
import 'package:clan/ui_components/cards/discussionCard.dart';
import 'package:clan/ui_components/sections/memberSection.dart';
import 'package:clan/ui_components/sections/clanBannerSection.dart';
import 'package:clan/ui_components/sections/achievementSection.dart';

class ClanApp extends StatefulWidget {
  @override
  State<ClanApp> createState() => _ClanAppState();
}

class _ClanAppState extends State<ClanApp> {
  DatabaseService data = DatabaseService();
  int _selectedIndex = 0;
  User? defaultUser;
  Clan? userClan;
  List<Discussion>? discussion;
  List<Activity>? activity;
  List<Performance>? performance;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder<List<User>>(
            stream: data.readDefaultUser(),
            builder: (context, user) {
              if (user.hasData) {
                defaultUser = user.data![0];
                return StreamBuilder<Clan>(
                    stream: data.readClan(defaultUser!.clan_id!),
                    builder: (context, clan) {
                      if (clan.hasData) {
                        return StreamBuilder<List<User>>(
                            stream: data.readClanMembers(defaultUser!.clan_id!),
                            builder: (context, clanMembers) {
                              if (clanMembers.hasData) {
                                userClan = Clan(
                                    name: clan.data!.name,
                                    banner: clan.data!.banner,
                                    league: clan.data!.league,
                                    wins: clan.data!.wins,
                                    rank: clan.data!.rank,
                                    xp: clan.data!.xp,
                                    members: clanMembers.data!);
                                return Homepage();
                              } else {
                                return const Loading();
                              }
                            });
                      } else {
                        return const Loading();
                      }
                    });
              } else {
                return const Loading();
              }
            }));
  }

  Scaffold Homepage() {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClanBannerSection(userClan: userClan),
            const SizedBox(height: 30),
            const Divider(
              height: 0.0,
              color: Colors.white,
              thickness: 4.0,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 15),
            AchievementSection(userClan: userClan),
            const SizedBox(height: 30),
            const Divider(
              height: 0.0,
              color: Colors.white,
              thickness: 4.0,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 15),
            Container(
              width: 450,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageHeadings(text: 'Past featured performances'),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 300,
                    width: 400,
                    child: StreamBuilder<List<Performance>>(
                        stream: data.readPerformances(defaultUser!.clan_id!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            performance = snapshot.data!;
                            return PerformanceCard(performance: performance);
                          } else {
                            return const Center(
                                child: Text(
                              "No Performance",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ));
                          }
                        }),
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
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 0.0,
              color: Colors.white,
              thickness: 4.0,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 15),
            Container(
              width: 450,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageHeadings(text: 'Live clan activities on platform'),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 300,
                    child: StreamBuilder<List<Activity>>(
                        stream: data.readActivities(defaultUser!.clan_id!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            activity = snapshot.data!;
                            return ActivityCard(activity: activity);
                          } else {
                            return const Center(
                                child: Text(
                              "No Activity",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ));
                          }
                        }),
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
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 0.0,
              color: Colors.white,
              thickness: 4.0,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 15),
            Container(
              width: 450,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageHeadings(text: 'Clan discussions'),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 190,
                    child: StreamBuilder<List<Discussion>>(
                        stream: data.readDiscussions(defaultUser!.clan_id!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            discussion = snapshot.data!;
                            return DiscussionCard(discussion: discussion);
                          } else {
                            return const Center(
                                child: Text(
                              "No Discussion",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ));
                          }
                        }),
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
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 0.0,
              color: Colors.white,
              thickness: 4.0,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 15),
            MemberSection(userClan: userClan),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar BottomNavBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: Colors.white,
            size: 45,
          ),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
            color: Colors.white,
            size: 45,
          ),
          label: 'Ranks',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.leaderboard,
            color: Colors.white,
            size: 45,
          ),
          label: 'Leaderboard',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.people_alt,
            color: Colors.white,
            size: 45,
          ),
          label: 'Members',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(defaultUser!.profile_image!),
              radius: 22.0,
            ),
          ),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFFD4D044),
      onTap: _onItemTapped,
    );
  }
}

