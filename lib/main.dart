import 'package:flutter/material.dart';

import 'Controller/Remote/Dio_Helper.dart';
import 'View/Screens/AuthenticationScreen/LoginScreen.dart';
import 'View/Screens/OnBoarding/On_boardingScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false, //دا بيخليني اتحكم في الشريط الي فوق ال app bar هو بيكون غير مسموح اني اعدل فيه فانا بديله قيمة false عشان اقدر اتحم فيه
          // systemOverlayStyle: ,
            backgroundColor: Colors.white,
          elevation: 0.0,
            titleTextStyle: TextStyle(color: Colors.blue)
        ),

      ),
      home:OnBoardinfScreen(),
    );
  }
}


