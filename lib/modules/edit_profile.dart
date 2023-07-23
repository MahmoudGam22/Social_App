// ignore_for_file: unused_local_variable, unused_import, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/iconbroken.dart';

// ignore: must_be_immutable
class Edit_ProfileScreen extends StatelessWidget {
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var biocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<socialcubit, socialstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var usermodel = socialcubit.get(context).usermodel;
        var profileimage = socialcubit.get(context).profileimage;
        var coverimage = socialcubit.get(context).coverimage;
        namecontroller.text = usermodel!.name;
        phonecontroller.text = usermodel.phone;
        biocontroller.text = usermodel.bio;
        return Scaffold(
          appBar: defaultappbar(
            context: context,
            title: 'Edit_Profile',
            actions: [
              TextButton(
                onPressed: () {
                  socialcubit.get(context).updateuserdata(
                      name: namecontroller.text,
                      bio: biocontroller.text,
                      phone: phonecontroller.text);
                },
                child: Text('Update'),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is socialupdateprofileloadingstate)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 180,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: coverimage == null
                                        ? NetworkImage('${usermodel.cover}')
                                        : FileImage(File(coverimage.path))
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    socialcubit.get(context).getcovereimage();
                                  },
                                  icon: CircleAvatar(
                                      radius: 20,
                                      child: Icon(
                                        IconBroken.Camera,
                                        size: 16,
                                      ))),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileimage == null
                                    ? NetworkImage('${usermodel.image}')
                                    : FileImage(File(profileimage.path))
                                        as ImageProvider,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  socialcubit.get(context).getprofileimage();
                                },
                                icon: CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 16,
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (socialcubit.get(context).profileimage != null ||
                      socialcubit.get(context).coverimage != null)
                    Row(
                      children: [
                        if (socialcubit.get(context).profileimage != null)
                          Expanded(
                            child: Column(children: [
                              defaultbutton(
                                  function: () {
                                    socialcubit.get(context).uploadprofileimage(
                                        name: namecontroller.text,
                                        phone: phonecontroller.text,
                                        bio: biocontroller.text);
                                  },
                                  text: 'Upload profile'),
                              if (state is socialupdateprofileloadingstate)
                                SizedBox(
                                  height: 5,
                                ),
                              if (state is socialupdateprofileloadingstate)
                                LinearProgressIndicator(),
                            ]),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        if (socialcubit.get(context).coverimage != null)
                          Expanded(
                              child: Column(
                            children: [
                              defaultbutton(
                                  function: () {
                                    socialcubit.get(context).uploadcoverimage(
                                        name: namecontroller.text,
                                        phone: phonecontroller.text,
                                        bio: biocontroller.text);
                                  },
                                  text: 'Upload cover'),
                              if (state is socialupdateprofileloadingstate)
                                SizedBox(
                                  height: 5,
                                ),
                              if (state is socialupdateprofileloadingstate)
                                LinearProgressIndicator(),
                            ],
                          )),
                      ],
                    ),
                  if (socialcubit.get(context).profileimage != null ||
                      socialcubit.get(context).coverimage != null)
                    SizedBox(
                      height: 20,
                    ),
                  defaultff(
                      controller: namecontroller,
                      kType: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                      label: 'Name',
                      prefix: Icon(IconBroken.User)),
                  SizedBox(
                    height: 10,
                  ),
                  defaultff(
                      controller: biocontroller,
                      kType: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Bio must not be empty';
                        }
                        return null;
                      },
                      label: 'Bio',
                      prefix: Icon(IconBroken.Info_Circle)),
                  SizedBox(
                    height: 10,
                  ),
                  defaultff(
                      controller: phonecontroller,
                      kType: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Phone must not be empty';
                        }
                        return null;
                      },
                      label: 'Phone',
                      prefix: Icon(IconBroken.Call)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
