import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooddelivery/model/fb_response.dart';

typedef UserStateCallback = void Function({required bool loggedIn});

class AuthController {
  AuthController._();

  static AuthController authController = AuthController._();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//login
  Future<FireBaseAuthResponse> sinIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user!.emailVerified) {
        String message = userCredential.user!.emailVerified
            ? 'Logged in successfully'
            : 'You must verify your email!';

        return FireBaseAuthResponse(
            id: userCredential.user!.uid, message: message, status: true);
      }
    } on FirebaseAuthException catch (e) {
      return _controlFirebaseException(e);
    } catch (e) {
      //
    }
    return FireBaseAuthResponse(
        id: 'No id user', message: 'Something went wrong', status: false);
  }

//create
  Future<FireBaseAuthResponse> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        //ارغاب المستخدم على تفيل الحساب
        await userCredential.user!.sendEmailVerification();
        //عملية ارسال ايميل تفعيل للمستخدم على حسابو
        return FireBaseAuthResponse(
            //ارجاع نجاح او فشل العملية
            message: 'Account created successfully',
            status: true);
      }
    } on FirebaseAuthException catch (e) {
      return _controlFirebaseException(e);
    } catch (e) {
      //
    }
    return FireBaseAuthResponse(message: 'Something went wrong', status: false);
  }

//forget
  Future<FireBaseAuthResponse> forgetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return FireBaseAuthResponse(
          message: 'Password rest email sent successfully', status: true);
    } on FirebaseAuthException catch (e) {
      return _controlFirebaseException(e);
    } catch (e) {
      //
    }
    return FireBaseAuthResponse(message: 'Something went wrong', status: false);
  }

//logout
  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  User? checkUser() {
    return _firebaseAuth.currentUser;
  }

  // StreamSubscription checkUserStatus(UserStateCallback userStateCallback) {
  //   return _firebaseAuth.authStateChanges().listen((User? user) {
  //     userStateCallback(loggedIn: user != null);
  //   });
  // }

  FireBaseAuthResponse _controlFirebaseException(
      FirebaseAuthException exception) {
    print('Messsge : ${exception.message}');
    // if (exception.code == 'email-already-in-use') {
    // } else if (exception.code == 'invalid-email') {
    // } else if (exception.code == 'operation-not-allowed') {
    // } else if (exception.code == 'weak-password') {
    // } else if (exception.code == 'user-disabled') {
    // } else if (exception.code == 'user-not-found') {
    // } else if (exception.code == 'wrong-password') {
    // } else if (exception.code == 'auth/invalid-email') {
    // } else if (exception.code == 'auth/user-not-found') {}
    return FireBaseAuthResponse(
        message: exception.message ?? 'Error occurred', status: false);
  }

/** login(String email, String password) async {
    try {
    final credential = await FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
    AppRouter.showCustomDialug('No user found for that email.');
    } else if (e.code == 'wrong-password') {
    AppRouter.showCustomDialug('Wrong password provided for that user.');
    }
    }
    }*/
//
// register(String email, String password) async {
//   try {
//     final credential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     print('object');
//     AppRouter.showCustomDialug('the account has been created auccessfully.');
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       AppRouter.showCustomDialug('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       AppRouter.showCustomDialug(
//           'The account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//   }
// }

}
