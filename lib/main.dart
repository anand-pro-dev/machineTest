import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_mvvm/auth/login_screen.dart';
import 'package:test_mvvm/home/add_scren.dart';
import 'package:test_mvvm/home/details_screen.dart';
import 'package:test_mvvm/home/home_page.dart';
import 'package:test_mvvm/provider/log_controller.dart';
import 'package:test_mvvm/provider/search_provider.dart';
import 'package:test_mvvm/provider/user_view_model.dart';
import 'package:test_mvvm/train/dummy.dart';
import 'package:test_mvvm/train/train_logic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => AddDetailsProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Project',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
            elevation: 0,
          ),

          // scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.amber,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // home: HomePage(),
        // home: TrainScheduleScreen(),
        home: LoginPage(),
        // home: DetialsScreen(),
      ),
    );
  }
}
