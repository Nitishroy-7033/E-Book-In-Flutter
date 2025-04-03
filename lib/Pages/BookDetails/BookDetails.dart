import 'dart:io';

import 'package:e_book/Components/BackButton.dart';
import 'package:e_book/Models/BookModel.dart';
import 'package:e_book/Pages/BookDetails/ActionButton.dart';
import 'package:e_book/Pages/BookDetails/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:e_book/Config/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bookDetails extends StatelessWidget {
  final BookModel book;
  const bookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(20),
              //height: 500,
              color: PrimaryColor,
              child: Row(
                children: [

                  Expanded(
                      child: headerWidget(
                        coverUrl: book.coverUrl!,
                        title: book.title!,
                        author: book.author!,
                        description: book.description!,
                        rating: book.rating!,
                        pages: book.pages.toString(),
                        languages: book.language!,
                        //audiolen: book.audioLen!,
                        bookurl:book.bookurl!,
                      ),
                  ),
                ],
              ),
            ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("About Book",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Flexible(
                              child: Text(book.description!,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("About Author",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Flexible(
                              child: Text(book.aboutAuthor!,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                       SizedBox(height: 25),
                       BookActionButton(
                         bookUrl: book.bookurl!,
                         title: book.title!,
                       ),
                      ],
                    ),
                  )

          ],
        ),
      ),
    );
  }
}
