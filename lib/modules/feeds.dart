// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/iconbroken.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            margin: EdgeInsets.all(8.0),
            child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              Image(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/person-enjoying-warm-nostalgic-sunset_52683-100695.jpg?w=996&t=st=1689945071~exp=1689945671~hmac=3f44dbc02a87dbaa76cc37a59e1ec6d507ca1372da0c7379511d649e67d9edd6'),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'communicate with friends',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ]),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:(context, index) => buildpostitem(context),
            separatorBuilder: (context, index) => SizedBox(
              height: 8,
            ),
            itemCount: 10, 
            ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
  Widget buildpostitem(context)=>
  Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/rear-view-young-female-with-loose-hair-dressed-stylish-warm-clothing-walking-down-coastline_273609-9711.jpg?t=st=1689920626~exp=1689921226~hmac=52226dabf1ecddf21bf0a7dee9f7cc46dcb38815c631f5861580d07aad13a651',
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Mahmoud Gamal',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        height: 1.4,
                                      ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                  size: 16,
                                ),
                              ],
                            ),
                            Text(
                              'january 21,2023 at 4:32 pm',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    height: 1.4,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 6),
                            child: Container(
                              height: 25,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: 1,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#software',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 6),
                            child: Container(
                              height: 25,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: 1,
                                padding: EdgeInsets.zero,
                                child: Text(
                                  '#flutter',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996&t=st=1689956585~exp=1689957185~hmac=3b089439c7e753b534b3fb0e09c8aa6770cff7c87d9e38131b87a3742a9bf9b8',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    IconBroken.Heart,
                                    size: 16,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '120',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    IconBroken.Chat,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '100 comment',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-photo/rear-view-young-female-with-loose-hair-dressed-stylish-warm-clothing-walking-down-coastline_273609-9711.jpg?t=st=1689920626~exp=1689921226~hmac=52226dabf1ecddf21bf0a7dee9f7cc46dcb38815c631f5861580d07aad13a651',
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'write a comment ...',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              size: 16,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Like',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
}
