import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Components/BackButton.dart';

class headerWidget extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String languages;
  //final String audiolen;

  const headerWidget({super.key, required this.coverUrl, required this.title, required this.author, required this.description, required this.rating, required this.pages, required this.languages, required String bookurl});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 30,width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(),
            SvgPicture.asset("Assets/Icons/heart.svg",
                color: Theme.of(context).colorScheme.background),
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: Image.network(coverUrl,
                width: 170,
              ),

            ),
          ],
        ),
        SizedBox(height: 30),
        Text(title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.surface),
        ),
        SizedBox(height: 10),
        Text("Author: $author",
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        // SizedBox(height: 10),
        // Text(description,
        //   style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.surface),
        // ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              children: [
                Text("Rating",style: TextStyle(color: Colors.yellowAccent),
                ),
                Text(rating,style: TextStyle(color: Colors.yellowAccent,),
                ),
              ],
            ),
            Column(
              children: [
                Text("Pages",style: TextStyle(color: Colors.yellowAccent),
                ),
                Text(pages,style: TextStyle(color: Colors.yellowAccent,),
                ),
              ],
            ),
            Column(
              children: [
                Text("Languages",style: TextStyle(color: Colors.yellowAccent),
                ),
                Text(languages,style: TextStyle(color: Colors.yellowAccent,),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
