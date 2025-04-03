import 'package:e_book/Components/PrimaryButton.dart';
import 'package:e_book/Controller/AuthController.dart';
import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});



  @override
  Widget build(BuildContext context) {
    Authcontroller authcontroller = Get.put(Authcontroller());
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.primary,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Text("SHORT BOOK",
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),

                        const SizedBox(height: 50),
                        Image.asset("Assets/Images/book.png",
                          width: 370,
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
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    "Disclamer",style: TextStyle(
                        color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
                    //style: Theme.of(context).textTheme.labelMedium,
                  ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Discover, read, and organize your favorite eBooks effortlessly with BookNest, the ultimate eBook application for book lovers. Whether you’re into fiction, non-fiction, fantasy, or self-help, BookNest provides a seamless reading experience tailored to your preferences.  ",
                      textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontSize: 15),
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
         const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),

            child: PrimaryButton(

              btnName: "LOGIN WITH GOOGLE",
                 ontap: () {
                   authcontroller.loginWithEmail();

                //Get.offAll(Homepage());//home page se wapis nahi aayga welcome page pe
              },

            ),
          ),
        ],
      ),);
  }
}
