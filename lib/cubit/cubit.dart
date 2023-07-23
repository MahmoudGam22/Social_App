// ignore_for_file: unused_import, unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/models/Usermodel.dart';
import 'package:social_app/modules/chats.dart';
import 'package:social_app/modules/feeds.dart';
import 'package:social_app/modules/newpost.dart';
import 'package:social_app/modules/settings.dart';
import 'package:social_app/modules/users.dart';
import 'package:social_app/shared/network/local/cashe_helper.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class socialcubit extends Cubit<socialstates> {
  var uid = Cashe_Helper.getdata(key: 'Uid');
  socialcubit() : super(socialinitialstate());
  static socialcubit get(context) => BlocProvider.of(context);
  UserModel? usermodel;
  void getUserdata() {
    emit(socialgetuserloadingstate());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      print(value.data());
      usermodel = UserModel.fromjson(value.data());
      emit(socialgetusersuccessstate());
    }).catchError((error) {
      emit(socialgetusererrorstates(error.toString()));
    });
  }

  int currentindex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'post',
    'Users',
    'Settings',
  ];
  File? profileimage;
  var picker = ImagePicker();
  Future<void> getprofileimage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      profileimage = File(PickedFile.path);
      emit(socialprofilepickedsuccessgstate());
    } else {
      emit(socialprofilepickederrorgstate());
      print('no image selected');
    }
  }

  File? coverimage;
  Future<void> getcovereimage() async {
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      coverimage = File(PickedFile.path);
      emit(socialcoverpickedsuccessgstate());
    } else {
      emit(socialcoverpickederrorgstate());
      print('no image selected');
    }
  }

  void uploadprofileimage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(socialupdateprofileloadingstate());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileimage!.path).pathSegments.last}')
        .putFile(profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(socialuploadprofilesuccessgstate());
        updateuserdata(name: name, phone: phone, bio: bio, image: value);
      }).catchError((error) {
        emit(socialuploadprofileerrorgstate());
      });
    }).catchError((error) {
      emit(socialuploadprofileerrorgstate());
    });
  }

  void uploadcoverimage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(socialupdateprofileloadingstate());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverimage!.path).pathSegments.last}')
        .putFile(coverimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateuserdata(name: name, phone: phone, bio: bio, cover: value);
      }).catchError((error) {
        emit(socialuploadcovererrorgstate());
      });
    }).catchError((error) {
      emit(socialuploadcovererrorgstate());
    });
  }

  // void updateuser({
  //   required String name,
  //   required String phone,
  //   required String bio,
  // }) {
  //   emit(socialupdateprofileloadingstate());
  //   if (coverimage != null) {
  //     uploadcoverimage();
  //   } else if (profileimage != null) {
  //     uploadprofileimage();
  //   } else if (coverimage != null && profileimage != null) {
  //   } else {
  //     updateuser(name: name, phone: phone, bio: bio);
  //   }
  // }

  void updateuserdata({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      bio: bio,
      Uid: usermodel!.Uid,
      email: usermodel!.email,
      cover: cover ?? usermodel!.cover,
      image: image ?? usermodel!.image,
      isemailverified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel!.Uid)
        .update(model.ToMap())
        .then((value) {
      getUserdata();
    }).catchError((error) {
      emit(socialupdateprofileerrorgstate());
    });
  }

  void changebootomnav(int index) {
    if (index == 2)
      emit(socialcnewpoststate());
    else {
      currentindex = index;
      emit(socialchangebottomnavstate());
    }
  }
}

class logincubit extends Cubit<loginstates> {
  logincubit() : super(logininitialstate());
  static logincubit get(context) => BlocProvider.of(context);
  void userlogin({
    required String email,
    required String password,
  }) {
    emit(loginloadingstate());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(loginsuccessstate(value.user!.uid));
    }).catchError((error) {
      emit(loginerrorstate(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool ispassword = true;
  void changepasswordvisibility() {
    ispassword = !ispassword;
    suffix =
        ispassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(loginpasswordvisiblestate());
  }
}

class registercubit extends Cubit<registerstates> {
  registercubit() : super(registerinitialstate());
  static registercubit get(context) => BlocProvider.of(context);
  void userregister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(registerloadingstate());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(name: name, phone: phone, email: email, Uid: value.user!.uid);
    }).catchError((error) {
      emit(registererrorstate());
    });
  }

  void userCreate({
    required String name,
    required String phone,
    required String email,
    required String Uid,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      email: email,
      Uid: Uid,
      isemailverified: false,
      bio: 'write your bio ...',
      image:
          'https://www.freepik.com/premium-vector/hand-drawn-people-working-together-illustration_20286004.htm',
      cover:
          'https://www.freepik.com/premium-vector/hand-drawn-people-working-together-illustration_20286004.htm',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(Uid)
        .set(model.ToMap())
        .then((value) {
      emit(createusersuccessstate());
    }).catchError((error) {
      emit(createusererrorstate(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool ispassword = true;
  void changepasswordvisibility() {
    ispassword = !ispassword;
    suffix =
        ispassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(registerpasswordvisiblestate());
  }
}
