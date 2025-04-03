import 'package:e_book/Components/BackButton.dart';
import 'package:e_book/Controller/AuthController.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Models/Data.dart';
import 'package:e_book/Pages/AddNewBook/addNewBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Components/PrimaryButton.dart';
import '../../Components/bookTile.dart';
import '../../Config/Colors.dart';
import '../BookDetails/BookDetails.dart';
import '../Homepage/HomePage.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Authcontroller authcontroller = Get.put(Authcontroller());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(addnewbook());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
         body: SingleChildScrollView(
           child: Column(
               children: [
               Container(
              // height: 300,
                 padding: const EdgeInsets.symmetric(vertical: 38,horizontal: 18),
                 color: Theme.of(context).colorScheme.primary,
                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(),
                    Text("Profile",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),
                    ),
                    IconButton(onPressed: () async{

                      authcontroller.signout();
                    },
                        icon: Icon(Icons.logout_sharp,
                      color: Theme.of(context).colorScheme.background,)),

                   // SizedBox(width: 50),
                  ],
                ),
                    SizedBox(height: 70),
                     Container(
                       padding: EdgeInsets.all(5),
                       decoration:  BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         border: Border.all(
                           width: 2,
                           color: Theme.of(context).colorScheme.background,
                         ),
                       ),
                       child: Container(
                         width: 100,
                         height: 100,
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(100),
                             child: Image.network("${authcontroller.auth.currentUser!.photoURL!}",
                              fit: BoxFit.cover,
                             ),
                         ),
                       ),
                     ),
                    SizedBox(height: 2),
                    Text("${authcontroller.auth.currentUser!.displayName}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                    ),
                    Text("${authcontroller.auth.currentUser!.email}",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer),
                    ),

                  ],
                ),
              )

            ]),
               ),
                  Padding(
                   padding: const EdgeInsets.all(10),
                     child: Column(
                        children: [
                             Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text(
                                "Your Books",
                           style: Theme.of(context).textTheme.labelMedium,
                           ),
                          ],
                         ),
                          SizedBox(height: 18),
                          Obx(() =>
                              Column(
                                  children: bookController.bookData.map((e) => booktile(
                                    // ontap: () {
                                    // Get.to(bookDetails(book: e));
                                    //},
                                    title: e.title!,
                                    coverUrl: e.coverUrl!,
                                    author: e.author!,
                                    // price: e.price!,
                                    rating: e.rating!,
                                    bookurl: e.bookurl!,
                                    totalRating: 15,
                                    ontap: (){
                                      Get.to(bookDetails(book: e));
                                    },
                                  ))
                                      .toList()

                              ),
                          ),


               ],
               ),
               ),

               ],
               ),
         ),
    );
  }
}
