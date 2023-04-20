import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wefellowship/src/configs/configs.dart';
import 'package:wefellowship/src/data/models/models.dart';
import 'package:wefellowship/src/data/providers/providers.dart';
import 'package:wefellowship/src/data/repositories/repositories.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> saveUserdata(
    ProviderRef ref,
    BuildContext context, {
    required String name,
    required String email,
    required String bio,
    required String dob,
    required String phoneNumber,
    required String fcmToken,
    required String joined,
    required String gender,
    required String country,
    required String countryCode,
    required String relationshipStatus,
    required File? profilePic,
    required bool isVerified,
  }) async {
    try {
      String uid = _auth.currentUser!.uid;
      String avatarUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      if (profilePic != null) {
        avatarUrl =
            await ref.read(storageBucketRepositoryProvider).storeFileToBucket(
                  'users/$uid',
                  profilePic,
                );
      }
      UserModel userModel;
      userModel = UserModel(
        uid: _auth.currentUser!.uid,
        name: name,
        email: email,
        phone: phoneNumber,
        fcmToken: fcmToken,
        bio: bio,
        dob: dob,
        gender: gender,
        createdAt: joined,
        isVerified: isVerified,
        relationshipstatus: relationshipStatus,
        avatar: avatarUrl,
        country: country,
        countrycode: countryCode,
      );
      await _users.doc(_auth.currentUser!.uid).set(userModel.toMap());

      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserCredential> loginWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential;
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return right(userCredential);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> signUpWithEmail(
    ProviderRef ref,
    BuildContext context, {
    required String name,
    required String password,
    required String email,
    required String bio,
    required String dob,
    required String phoneNumber,
    required String fcmToken,
    required String joined,
    required String gender,
    required String country,
    required String countryCode,
    required String relationshipStatus,
    required File? profilePic,
    required bool isVerified,
  }) async {
    try {
      UserCredential userCredential;
      String uid = _auth.currentUser!.uid;
      String avatarUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      if (profilePic != null) {
        avatarUrl =
            await ref.read(storageBucketRepositoryProvider).storeFileToBucket(
                  'users/$uid',
                  profilePic,
                );
      }

      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          uid: _auth.currentUser!.uid,
          name: name,
          email: email,
          phone: phoneNumber,
          fcmToken: fcmToken,
          bio: bio,
          dob: dob,
          gender: gender,
          createdAt: joined,
          isVerified: isVerified,
          relationshipstatus: relationshipStatus,
          avatar: avatarUrl,
          country: country,
          countrycode: countryCode,
        );
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserCredential> signInWithGoogle() async {
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        final googleAuth = await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        userCredential = await _auth.signInWithCredential(credential);
        //   userCredential =
        //       await _auth.currentUser!.linkWithCredential(credential);
        // }
      }
      return right(userCredential);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }

  void logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
