import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clan/models/user_model.dart';
import 'package:clan/models/clan_model.dart';
import 'package:clan/models/discussion_model.dart';
import 'package:clan/models/activities_model.dart';
import 'package:clan/models/performance_model.dart';

class DatabaseService {
  List<User> _usersFromSnap(QuerySnapshot snapshot) => snapshot.docs
      .map((doc) => User(
            clan_id: doc.get('clan_id'),
            name: doc.get('name'),
            profile_image: doc.get('profile_image'),
            position: doc.get('position'),
          ))
      .toList();

  List<Activity> _activitiesFromSnap(QuerySnapshot snapshot) => snapshot.docs
      .map((doc) => Activity(
            image: doc.get('image'),
            heading: doc.get('heading'),
          ))
      .toList();

  List<Discussion> _discussionsFromSnap(QuerySnapshot snapshot) => snapshot.docs
      .map((doc) => Discussion(
            heading: doc.get('heading'),
            unread_messages: doc.get('unread_messages'),
            live_status: doc.get('live_status'),
          ))
      .toList();

  List<Performance> _performancesFromSnap(QuerySnapshot snapshot) =>
      snapshot.docs
          .map((doc) => Performance(
                image: doc.get('image'),
                heading: doc.get('heading'),
              ))
          .toList();

  Clan _clanFromSnap(DocumentSnapshot snapshot) => Clan(
        name: snapshot.get('name'),
        banner: snapshot.get('banner'),
        league: snapshot.get('league'),
        rank: snapshot.get('rank'),
        xp: snapshot.get('xp'),
        wins: snapshot.get('wins'),
      );

  Stream<List<User>> readClanMembers(String clan_id) {
    CollectionReference dataCollection = FirebaseFirestore.instance
        .collection('Clan')
        .doc(clan_id)
        .collection('Members');
    return dataCollection
        .snapshots(includeMetadataChanges: true)
        .map(_usersFromSnap);
  }

  Stream<List<Activity>> readActivities(String clan_id) {
    CollectionReference dataCollection = FirebaseFirestore.instance
        .collection('Clan')
        .doc(clan_id)
        .collection('Activities');
    return dataCollection
        .snapshots(includeMetadataChanges: true)
        .map(_activitiesFromSnap);
  }

  Stream<List<Discussion>> readDiscussions(String clan_id) {
    CollectionReference dataCollection = FirebaseFirestore.instance
        .collection('Clan')
        .doc(clan_id)
        .collection('Discussions');
    return dataCollection
        .snapshots(includeMetadataChanges: true)
        .map(_discussionsFromSnap);
  }

  Stream<List<Performance>> readPerformances(String clan_id) {
    CollectionReference dataCollection = FirebaseFirestore.instance
        .collection('Clan')
        .doc(clan_id)
        .collection('Performances');
    return dataCollection
        .snapshots(includeMetadataChanges: true)
        .map(_performancesFromSnap);
  }

  Stream<Clan> readClan(String clan_id) {
    DocumentReference dataCollection =
        FirebaseFirestore.instance.collection('Clan').doc(clan_id);
    return dataCollection
        .snapshots(includeMetadataChanges: true)
        .map(_clanFromSnap);
  }

  Stream<List<User>> readDefaultUser() {
    CollectionReference dataCollection =
        FirebaseFirestore.instance.collection('Default_user');
    return dataCollection
        .snapshots(includeMetadataChanges: true)
        .map(_usersFromSnap);
  }
}
