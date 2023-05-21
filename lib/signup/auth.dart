import 'package:deal_mart/Home/home.dart';
import 'package:deal_mart/exception/sign%20up.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/signup/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googlesignin = GoogleSignIn();
googleSignIn() async{
 GoogleSignInAccount? googleSignInAccount = await googlesignin.signIn();

 if(googleSignInAccount != null) {
  GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
   accessToken: googleSignInAuthentication.accessToken,
   idToken: googleSignInAuthentication.idToken
  );
  final userCredential =
  await FirebaseAuth.instance.signInWithCredential(credential);
  final user = userCredential.user;
  print(user?.uid);
  return Future.value(true);
 }
}

class authrepo extends GetxController {
 static authrepo get instatance => Get.find();

 //variables
 final _auth = FirebaseAuth.instance;
 late final Rx<User?> firebaseUser;

 @override
 void onReady() {
  firebaseUser = Rx<User?>(_auth.currentUser);
  firebaseUser.bindStream(_auth.userChanges());
  ever(firebaseUser, _setInitialScreen);
 }


 _setInitialScreen(User? user) {
  user == null ? Get.offAll(() => const loginpage()) : Get.offAll(loginpage());
 }

 Future<void> createEmailWithPassword(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser != null ? Get.offAll(() => const loginpage()) : Get.offAll(home());
  } on FirebaseAuth catch (e) {

   final ex = SignupEmailWithPasswordfaliure.code('error');
   print(FirebaseAuthException(code: (ex.messsage)));
   throw ex;
    // TODO00

  }
 }
 Future<void> loginEmailWithPassword(String email, String password) async {
  try {
   await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuth catch (e) {

   // TODO

  }
  Future<void> logout() async => await _auth.signOut();
 }

}