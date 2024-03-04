import 'package:alarm/alarm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/firebase_options.dart';
import 'package:fitness/provider/firebase/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/colo_extension.dart';
import 'provider/firebase/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED, persistenceEnabled: true);
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
//  await FirebaseAuth.instance.setPersistenceEnabled(false);

  await Alarm.init(showDebugLogs: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyAuthProvider>(
          create: (_) => MyAuthProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Fitness 3 in 1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: TColor.primaryColor1, fontFamily: "Poppins"),
        home: const AuthWrapper(),
      ),
    );
  }
}
