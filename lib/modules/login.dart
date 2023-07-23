// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/layout/social.dart';
import 'package:social_app/modules/register.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cashe_helper.dart';

class LoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();   
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => logincubit(),
      child: BlocConsumer<logincubit,loginstates>(
        listener: (context, state) {
          if(state is loginerrorstate){
            showToast(text: state.error, state: Toaststates.ERROR);
          }
          if(state is loginsuccessstate){
            Cashe_Helper.savedata(key: 'Uid', value: state.Uid).then((value){
              navigateandfinish(context, SocialLayot());
            });
          }
        },
        builder:(context, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'Login now to communicate with friends',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defaultff(
                          controller: emailcontroller,
                          kType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          label: 'Email Adrress',
                          prefix: Icon(Icons.email_outlined)),
                      SizedBox(
                        height: 15,
                      ),
                      defaultff(
                          controller: passwordcontroller,
                          kType: TextInputType.visiblePassword,
                          suffix: logincubit.get(context).suffix,
                          ispassword: logincubit.get(context).ispassword,
                          suffixpressed: () {
                            logincubit.get(context).changepasswordvisibility();
                          },
                          onsubmit: (value) {
                            if (formkey.currentState!.validate()) {
                              logincubit.get(context).userlogin(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text);
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                            return null;
                          },
                          label: 'password',
                          prefix: Icon(Icons.lock_clock_outlined)),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: State is! loginloadingstate,
                        builder: (context) => defaultbutton(
                            function: () {
                              if (formkey.currentState!.validate()) {
                                logincubit.get(context).userlogin(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text);
                              }
                            },
                            text: 'login',
                            isuppercase: true),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('don\'t have an account?'),
                          defaulttextbutton(
                              fuction: () {
                                navigateto(context, RegisterScreen());
                              },
                              text: 'register'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
