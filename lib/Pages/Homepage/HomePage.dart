import 'package:e_book/Components/BookCart.dart';
import 'package:e_book/Components/bookTile.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Models/Data.dart';
import 'package:e_book/Pages/BookDetails/BookDetails.dart';
import 'package:e_book/Pages/CategoryDetailsPage/CategoryDetails.dart';
import 'package:e_book/Pages/Homepage/Widgets/Appbar.dart';
import 'package:e_book/Pages/Homepage/Widgets/Category.dart';
import 'package:e_book/Pages/Homepage/Widgets/MyInputTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AuthController.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    Authcontroller authcontroller = Get.put(Authcontroller());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              // height: 500,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          HomeAppBar(),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Text(
                                "Welcome😊",
                                style: TextStyle(
                                    color: Colors.yellowAccent, fontSize: 18),
                                //style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:Theme.of(context).colorScheme.background),
                              ),
                              Text(
                                "${authcontroller.auth.currentUser!.displayName}",
                                style: TextStyle(
                                    color: Colors.yellowAccent, fontSize: 22),
                                //style: Theme.of(context).textTheme.headlineMedium?.copyWith(color:Theme.of(context).colorScheme.background),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Time to read book and enhance your knowledge",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Myinputtextfield(),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Categories",
                                //style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoryData
                                  .map(
                                    (e) => InkWell(
                                      onTap: (){
                                        bookController.searchBookByCategory(e['label']!);
                                        Get.to(Categorydetails(categoryName: e['label']!, books: bookController.categoryBook));
                                      },
                                      child: categoryWidget(
                                          iconPath: e["icon"]!,
                                          btnName: e["label"]!),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Trending",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        //style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => Row(
                        children: bookController.bookData
                            .map((e) => bookCard(
                                  title: e.title!,
                                  coverUrl: e.coverUrl!,
                                  ontap: () {
                                    Get.to(bookDetails(book: e));
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                  ),
                  Row(
                    children: [
                      Text(
                        "Your Interests",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        //style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => Column(
                        children: bookController.bookData
                            .map((e) => booktile(
                                  ontap: () {
                                    Get.to(bookDetails(book: e));
                                  },
                                  title: e.title!,
                                  coverUrl: e.coverUrl!,
                                  author: e.author!,
                                  // price: e.price!,
                                  rating: e.rating!,
                                  bookurl: e.bookurl!,
                                  totalRating: 12,
                                ))
                            .toList()),
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
