import 'package:e_book/Components/PrimaryButton.dart';
import 'package:e_book/Controller/BookController.dart';
import 'package:e_book/Controller/PdfController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Components/BackButton.dart';
import '../../Components/MultiLineTextFormField.dart';
import '../../Components/MyTextFormField.dart';
import '../../Config/Colors.dart';
import '../../Models/Data.dart';
class addnewbook extends StatelessWidget {
  const addnewbook({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    PdfController pdfController = Get.put(PdfController());
    BookController bookController = Get.put(BookController());
    RxString categoryValue = "literature".obs;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              // height: 300,
              padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 18),
              color: Theme.of(context).colorScheme.primary,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                          Text(
                            "ADD NEW BOOK",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                            // style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),
                          ),
                          SizedBox(width: 50),
                        ],
                      ),
                      SizedBox(height: 70),
                      InkWell(
                          onTap: () {
                            bookController.pickImage();
                          },
                          child: Obx(
                            () => Container(
                              height: 150,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Center(
                                child: bookController.isImageUploading.value
                                    ? CircularProgressIndicator(
                                        color: PrimaryColor,
                                      )
                                    : bookController.imageUrl.value == ""
                                        ? Image.asset(
                                            "Assets/Icons/addImage.png")
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              bookController.imageUrl.value,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ])),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                //  SizedBox(width: 250),
                InkWell(
                  onTap: () {
                    // pdfController.pickPDF();
                    //bookController.pickPDF();
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: bookController.isPdfUploading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: backgroundColor,
                              ),
                            )
                          : bookController.pdfUrl.value == ""
                              ? InkWell(
                                  onTap: () {
                                    // pdfController.pickPDF();
                                    bookController.pickPDF();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("Assets/Icons/upload.png",
                                          color: Colors.green),
                                      SizedBox(width: 8),
                                      Text(
                                        "Book PDF",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    // pdfController.pickPDF();
                                    bookController.pdfUrl.value = "";
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("Assets/Icons/delete.png",
                                          color: Colors.red),
                                      SizedBox(width: 8),
                                      Text(
                                        "Remove Pdf",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background),
                                      ),
                                    ],
                                  ),
                                ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Book title",
                  icon: Icons.book,
                  controller: bookController.title,
                ),
                SizedBox(height: 10),
                MultiLineTextField(
                    hintText: "Book Description",
                    // icon: Icons.description,
                    controller: bookController.des),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Author Name",
                  icon: Icons.person,
                  controller: bookController.auth,
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "About Author",
                  icon: Icons.person,
                  controller: bookController.aboutAuth,
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                        child: Obx(()=>DropdownButton(
                          hint: Text("Select Category"),
                          isExpanded: true,
                          value: categoryValue.value,
                          items:                           
                          categoryData.map((e)=>
                          DropdownMenuItem(
                            value: e["key"],
                            child: Text(e["label"]!),
                            )).toList()
                          , onChanged: (value){
                            categoryValue.value = value!;
                            bookController.selectedCategory.value = value!;
                          }),)
                      ),
                    ),
                  ],
                )
              ,
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Pages",
                  isNumber: true,
                  icon: Icons.pages_outlined,
                  controller: bookController.pages,
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Rating",
                  isNumber: true,
                  icon: Icons.rate_review,
                  controller: bookController.ratings,
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  hintText: "Language",
                  icon: Icons.language,
                  controller: bookController.language,
                ),

                // SizedBox(height: 10),
                //  MyTextFormField(
                //     hintText: "Audio Len",
                //     icon: Icons.audiotrack,
                //     controller: controller,//bookController.audioLen,
                //   ),

                SizedBox(height: 10),
               Row(children: [
                 Expanded(
                   child: PrimaryButton(
                      btnName: "Save",
                      ontap: () {
                        bookController.createBook();
                      }),
                 ),
                 SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                      btnName: "Cancle",
                      ontap: () {
                        Get.back();
                      }),
                ),
               ],)
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
