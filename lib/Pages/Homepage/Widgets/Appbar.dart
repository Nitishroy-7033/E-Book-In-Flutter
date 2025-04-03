import 'package:e_book/Controller/AuthController.dart';
import 'package:e_book/Pages/Profilepage/Profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Config/Colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    Authcontroller authcontroller = Get.put(Authcontroller());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        SvgPicture.asset("Assets/Icons/dashboard.svg"),
        Text("SHORT BOOK",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),
         // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        InkWell(
          onTap: ()
          {
            Get.to(profilePage());
          },
          child: CircleAvatar(
            radius: 21,
            backgroundColor:
            Theme.of(context).colorScheme.background,
            child: ClipRRect(
             borderRadius: BorderRadius.circular(100),
              child:Image.network(authcontroller.auth.currentUser!.photoURL!),
    ),
          ),
        ),
      ],
    );
  }
}
