import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData(
      {required String username,
      required String email,
      required Uint8List file}) async {
    String resp = "Some error occurred";
    try {
      if (username.isNotEmpty || email.isNotEmpty) {
        String imageUrl = await uploadImageToStorage('imageLink', file);
        await _firestore
            .collection('userProfile')
            .add({'username': username, 'email': email, 'imageLink': imageUrl});
        resp = "success";
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
