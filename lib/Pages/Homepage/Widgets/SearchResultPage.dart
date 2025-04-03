import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Components/bookTile.dart';
import '../../../Models/BookModel.dart';
import '../../BookDetails/BookDetails.dart';
class SearchResultPage extends StatelessWidget {
  final List<BookModel> books;
  final String searchQuery;

  const SearchResultPage({Key? key, required this.searchQuery, required this.books}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text(searchQuery)),
      
      body: 
      SingleChildScrollView(

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
                          totalRating: 10,
                        ),
                      )
                      .toList(),
                ),
      )
    );
  }
}


 /*
  return Scaffold(
    appBar: AppBar(
      title: Text('Search Results'),
    ),
    body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Books').where('Search_Title_Index', arrayContains: widget.searchQuery).snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        // else{
        //   //Fetch data here
        //   print(snapshot.data);
        //   return ListView(
        //     children: [
        //       ...snapshot.data!.docs.where(
        //               (QueryDocumentSnapshot<Object?> element) => element['titie']
        //           .toString()
        //           .toLowerCase()
        //           .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data){
        //
        //             final String title = data.get('title');
        //             final String image = data['coverUrl'];
        //             final String name = data('author');
        //
        //
        //
        //       })
        //
        //     ],
        //   );
        // }

         final documents = snapshot.data!.docs;
         return ListView.builder(
           itemCount: documents.length,
           itemBuilder: (context, index) {
             return booktile(
               title: documents[index]['title'],
               coverUrl: documents[index]['coverUrl'],
               author: documents[index]['author'],
               rating: documents[index]['rating'],
               bookurl: documents[index]['bookurl'],
               totalRating: 15,
               ontap: () {
                 // Navigate to book details page
               },
             );
           },
         );
      },
    ),
  );
  }
}

  */