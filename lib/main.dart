import 'package:firebase_core/firebase_core.dart';
import 'package:fitxcel/Auth/Firebase%20auth/firebase_login.dart';
import 'package:fitxcel/controllers/bankscreen_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCLos5lwHwt-AdMVkYxh8evtMRrXbG3Pmw",
        authDomain: "testing-69a29.firebaseapp.com",
        projectId: "testing-69a29",
        storageBucket: "testing-69a29.appspot.com",
        messagingSenderId: "218257069236",
        appId: "1:218257069236:web:82452d1d102cc481fa73e1",
        measurementId: "G-3YM9X5LXKX",
        databaseURL: "https://your-database-id.firebasedatabase.app",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BankScreenController()),
      ],
      child: MaterialApp(
        title: 'fitXcel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFFFFFF)),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
