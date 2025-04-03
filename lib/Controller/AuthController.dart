import 'package:e_book/Config/Message.dart';
import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:e_book/Pages/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcontroller extends GetxController{

  RxBool isLoading = false.obs;

  final auth = FirebaseAuth.instance;

  void loginWithEmail() async{
    isLoading.value = true;
   try{
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

     //create a new credential
     final credential = GoogleAuthProvider.credential(
       accessToken: googleAuth?.accessToken,
       idToken: googleAuth?.idToken,
     );
     await auth.signInWithCredential(credential);
     successMessage("Login Sucess");
     Get.offAll(Homepage());
   } catch(ex){
     print(ex);
     errorMessage("Error! Try Again");
   }

   isLoading.value = false;
  }

  void signout() async{
  await auth.signOut();
  successMessage("Logout");
  Get.offAll(Welcomepage());
  }
}