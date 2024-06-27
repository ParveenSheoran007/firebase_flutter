import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter/auth/provider/auth_provider.dart';
import 'package:firebase_flutter/auth/ui/login_screen.dart';
import 'package:firebase_flutter/dashboard_screen.dart';
import 'package:firebase_flutter/firebase_options.dart';
import 'package:firebase_flutter/language_screen.dart';
import 'package:firebase_flutter/util/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  runApp(const WeTubeApp());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class WeTubeApp extends StatefulWidget {
  const WeTubeApp({super.key});

  @override
  _WeTubeAppState createState() => _WeTubeAppState();
}

class _WeTubeAppState extends State<WeTubeApp> {
  late StorageHelper storageHelper;
  bool isLanguageSelected = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    storageHelper = StorageHelper();
    _checkLanguageSelected();
  }

  Future<void> _checkLanguageSelected() async {
    isLanguageSelected = await storageHelper.isLanguageSelected();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(storageHelper),
        )
      ],
      child: Consumer<AuthenticationProvider>(
        builder: (context, provider, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Flutter Demo",
            theme: ThemeData(),
            home:
                 const LanguageScreen(),
          );
        },
      ),
    );
  }
}
