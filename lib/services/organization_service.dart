import 'dart:io';

import 'package:application8/models/organization_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'user_service.dart';

class OrganizationService {
  static Future<void> addOrganization(
    String orgEmail,
    String orgName,
    String orgDesc,
    String imageUrl,
  ) async {
    try {
      final userId = UserService.getUserId();
      final doc = FirebaseFirestore.instance.collection('organization').doc();
      final storageRef =
          FirebaseStorage.instance.ref().child('organization_media/$doc.id');
      final uploadTask = storageRef.putFile(File(imageUrl));
      await uploadTask.whenComplete(
        () async {
          final imageUrl = await storageRef.getDownloadURL();
          await doc.set(
            {
              'orgId': doc.id,
              'userId': userId,
              'orgEmail': orgEmail,
              'orgName': orgName,
              'image': doc.id,
              'orgDesc': orgDesc,
              'imageUrl': imageUrl,
            },
          );
        },
      );
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> addOrganization1(
    String orgEmail,
    String orgName,
    String orgDesc,
  ) async {
    try {
      final userId = UserService.getUserId();
      final doc = FirebaseFirestore.instance.collection('organization').doc();
      await doc.set({
        'id': doc.id,
        'userId': userId,
        'orgName': orgName,
        'orgEmail': orgEmail,
        'orgDesc': orgDesc,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Organization> getOrganizationByUserId(String id) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("organization")
        .where(id)
        .get();
    final List<Organization> organizations =
        snapshot.docs.map((doc) => Organization.fromMap(doc.data())).toList();
    if (organizations.isNotEmpty) {
      return organizations.first;
    }
    throw "No organization with id $id found";
  }
}
