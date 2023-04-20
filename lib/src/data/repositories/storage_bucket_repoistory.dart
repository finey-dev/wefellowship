import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/providers/providers.dart';

final storageBucketRepositoryProvider = Provider(
  (ref) => StorageBucketRepository(
    firebaseStorage: ref.read(storageProvider),
  ),
);

class StorageBucketRepository {
  final FirebaseStorage firebaseStorage;
  StorageBucketRepository({
    required this.firebaseStorage,
  });

  Future<String> storeFileToBucket(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
