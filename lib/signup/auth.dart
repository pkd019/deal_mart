import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/Home/home.dart';
import 'package:deal_mart/exception/sign%20up.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:deal_mart/signup/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:deal_mart/signup/controller.dart';


FirebaseAuth auth = FirebaseAuth.instance;
final _auth = FirebaseAuth.instance;
final userInfo = _auth.currentUser;
var verificationId = '';

///for google sign in************************************************************************

final googlesignin = GoogleSignIn();
googleSignIn() async{
 GoogleSignInAccount? googleSignInAccount = await googlesignin.signIn();

 if(googleSignInAccount != null) {
  GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
   accessToken: googleSignInAuthentication.accessToken,
   idToken: googleSignInAuthentication.idToken
  );
  //taking user credentials
  final userCredential =
  await FirebaseAuth.instance.signInWithCredential(credential);
  final user = userCredential.user;
  print(user?.uid);
  return Future.value(true);
 }
}
/// using getx controller ***************************************************************************

class authrepo extends GetxController {
 static authrepo get instatance => Get.find();

 ///variables***************************************************************************************

 final _auth = FirebaseAuth.instance;
 late final Rx<User?> firebaseUser;

  get verificationId =>verificationId ;


/// using onready function******************************************************************************
 @override
 void onReady() {
  firebaseUser = Rx<User?>(_auth.currentUser);
  firebaseUser.bindStream(_auth.userChanges());
  ever(firebaseUser, _setInitialScreen);
 }

/// checking user sign in or not ***********************************************************************

 _setInitialScreen(User? user) {
  user == null ? Get.offAll(() =>  loginpage()) : Get.offAll(bottomNav());
 }


///for email verification*****************************************************************************************


 Future<void> createEmailWithPassword(String email, String password) async {
  try {
   await _auth.createUserWithEmailAndPassword(email: email, password: password);
   firebaseUser != null ? Get.offAll(() => bottomNav()) : Get.offAll(
       loginpage());
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

 ///phone verification***********************************************************************************

 Future<void> phoneVerification(String phone) async {
  await _auth.verifyPhoneNumber(
   phoneNumber: phone,
   verificationCompleted: (credential) async {

    await _auth.signInWithCredential(credential);

   },

   verificationFailed: (FirebaseAuthException e) {
    if(e.code == 'invalid phone_number'){
     GetSnackBar(title: 'provide phone number is not valid.');
    }
    else(GetSnackBar(title: "something error occurs",));
    // Handle error
    print(e);
   },
   codeSent: (verificationId, resendToken)  {
this.verificationId.value = verificationId;
   },
   codeAutoRetrievalTimeout: ( verificationId){
    this.verificationId.value = verificationId;

   },
  );
 }


/// otp verification*************************************************************************************8

  Future<bool> verifyOTP(String otp) async{
  var credentials=
  await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp));

return credentials.user!= null ? true : false;
  }



}
