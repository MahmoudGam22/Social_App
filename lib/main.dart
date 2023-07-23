// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/layout/social.dart';
import 'package:social_app/modules/login.dart';
import 'package:social_app/shared/network/local/cashe_helper.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/styles/themes.dart';

import 'cubit/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  Widget widget;
  await Cashe_Helper.init();
 var Uid = Cashe_Helper.getdata(key: 'Uid');
 if(Uid !=null){
  widget=SocialLayot();
 }else{
  widget=LoginScreen();
 }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;
  MyApp(this.startwidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => socialcubit()..getUserdata(),
      child: BlocConsumer<socialcubit,socialstates>(
        listener: (context, state) {
        },
        builder:(context, state) =>  MaterialApp(
          theme: lighttheme,
          debugShowCheckedModeBanner: false,
          home: startwidget,
        ),
      ),
    );
  }
}
