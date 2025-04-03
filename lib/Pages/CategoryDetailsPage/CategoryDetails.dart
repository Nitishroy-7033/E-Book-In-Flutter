import 'package:e_book/Models/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/bookTile.dart';
import '../BookDetails/BookDetails.dart';

class Categorydetails extends StatelessWidget {
  final List<BookModel> books;
  final String categoryName;

  const Categorydetails(
      {Key? key, required this.categoryName, required this.books})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryName )),
        body: SingleChildScrollView(
          child: books.length == 0
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.book), Text("Book Not Found"),
                  Row(children: [],)],
                )
              : Column(
                  children: books
                      .map(
                        (e) => booktile(
                          ontap: () {
                            Get.to(bookDetails(book: e));
                          },
                          title: e.title!,
                          coverUrl: e.coverUrl!,
                          author: e.author!,
                          rating: e.rating!,
                          bookurl: e.bookurl!,
                          totalRating: 12,
                        ),
                      )
                      .toList(),
                ),
        ));
  }
}
