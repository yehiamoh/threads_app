import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:threads/models/user_model.dart';
import 'package:threads/screens/home_screen.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        final user=snapshot.data;
        if(user!=null){
          return const HomeScreen();
        }
        else{
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                children: [
                  Image.asset('assets/Pattern.png'),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff191919),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async{
                        final userCredintial= await signInWithGoogle();
                        final userId=userCredintial.user?.uid;
                        final userModel= UserModel(
                            id: userId!,
                            name:userCredintial.user!.displayName! ,
                            photo: userCredintial.user!.photoURL!,
                        );
                        FirebaseFirestore.instance.collection('users').doc(userId).set(userModel.tojson());
                      },
                      child: const ListTile(
                        title: Text(
                          'Login with Google',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '@YehiaMohamed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

      }
    );
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

