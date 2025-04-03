import 'package:e_book/Pages/BookPage/Bookpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Config/Colors.dart';

class BookActionButton extends StatelessWidget {
  final String bookUrl;
  final String title;
  const BookActionButton({super.key, required this.bookUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 18),
      decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Get.to(BookPage(
                bookUrl: bookUrl,
                title: title,
              ));
            },
            child: Row(
              children: [
                SvgPicture.asset("Assets/Icons/book.svg"),
                SizedBox(width: 10),
                Text("READ BOOK",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.surface,
                      letterSpacing: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
