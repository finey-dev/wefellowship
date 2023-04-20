import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/repositories/repositories.dart';
import 'package:wefellowship/src/data/models/models.dart';
import 'package:wefellowship/src/configs/configs.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false); // loading

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  void loginWithEmail(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final user = await _authRepository.loginWithEmail(
      email: email,
      password: password,
    );

    user.fold(
        (l) => showSnackBar(
              context: context,
              content: l.message,
            ), (r) async {
      Navigator.pushNamed(
        context,
        Home.routeName,
      );
    });
  }

  void signUpWithEmail(
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
    final user = await _authRepository.signUpWithEmail(
      ref,
      context,
      name: name,
      password: password,
      email: email,
      bio: bio,
      dob: dob,
      phoneNumber: phoneNumber,
      fcmToken: fcmToken,
      joined: joined,
      gender: gender,
      country: country,
      countryCode: countryCode,
      relationshipStatus: relationshipStatus,
      profilePic: profilePic,
      isVerified: isVerified,
    );
    user.fold(
      (l) => showSnackBar(
        context: context,
        content: l.message,
      ),
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void saveUserData(
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
    final userData = await _authRepository.saveUserdata(
      ref,
      context,
      name: name,
      email: email,
      bio: bio,
      dob: dob,
      phoneNumber: phoneNumber,
      fcmToken: fcmToken,
      joined: joined,
      gender: gender,
      country: country,
      countryCode: countryCode,
      relationshipStatus: relationshipStatus,
      profilePic: profilePic,
      isVerified: isVerified,
    );
    userData.fold(
      (l) => showSnackBar(
        context: context,
        content: l.message,
      ),
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false;
    user.fold(
      (l) => showSnackBar(
        context: context,
        content: l.message,
      ),
      (userCredential) async {
        if (userCredential.additionalUserInfo!.isNewUser) {
          //Navigate to Sign Up Page
          Navigator.pushNamedAndRemoveUntil(
            context,
            Authentication.routeName,
            (route) => false,
          );
        } else {
          //Navigate to Home Page
          Navigator.pushNamed(
            context,
            Home.routeName,
          );
        }
      },
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  void logout() async {
    _authRepository.logOut();
  }
}
