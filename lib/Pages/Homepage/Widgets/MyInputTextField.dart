import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book/Pages/Homepage/Widgets/SearchResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Controller/BookController.dart';

class Myinputtextfield extends StatelessWidget {
  const Myinputtextfield({super.key});

  @override
  Widget build(BuildContext context) {
  BookController bookController = Get.put(BookController());
  final TextEditingController _searchController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          SvgPicture.asset("Assets/Icons/search.svg"),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search here  ",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
               onChanged: (query) {
                 
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
               bookController.searchBookByTitle(_searchController.text);
               Get.to(SearchResultPage(
                books: bookController.searchedBook,
                searchQuery: _searchController.text,
                ),);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SearchResultPage(searchQuery: _searchController.text)),
              // );
            },
          ),
        ],
      ),
    );
  }
}




