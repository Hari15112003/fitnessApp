import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/view/login/login_view.dart';
import 'package:fitness/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the auth state
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data is User) {
          // User is signed in, navigate to the desired page
          return const WelcomeView();
          // return const SplashScreen();
        } else {
          // User is not signed in, navigate to the sign-in screen
          return const LoginView();
        }
      },
    );
  }
}

// i am doing an application in flutter for fitness app ,  i am storing details like weight , height , name , email and password i am having  an auth provider , and i want to store the user details to  firebase and also i am having categories such as workout he / she want to do i an particular day  and sleeping time that  he had taken and also i want maintain the history for him  like sleeping history and  workout history and also maintain a schedule for him like tomorrow abs , on future workout schedule and also i want to store all i database and maintain it in firestore , how can i effectively use those provider and collection , doc maintainance
