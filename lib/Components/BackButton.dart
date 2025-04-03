import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
        child:Row(
          children: [
            SizedBox(height: 10,width: 5),
            SvgPicture.asset("Assets/Icons/back.svg"),
             SizedBox(width: 10),
              Text("Back",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.surface),
              ),
          ],
        ),
    );

  }
}
