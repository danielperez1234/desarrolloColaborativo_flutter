import 'package:flutter/material.dart';
import 'package:materia/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Colors
        primaryColor: Color(0xFF032059),
        //accentColor: Color(0xFF8C203D),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFBAC5D9),
        errorColor: Color(0xFFD9043D),
        canvasColor: Color(0xFFD9043D),
        cardColor: Color(0xFF335AA6),
        dialogBackgroundColor: Color(0xFFFFFFFF),
        disabledColor: Color(0xFF335AA6),
        dividerColor: Color(0xFF335AA6),
        focusColor: Color(0xFF8C203D),
        highlightColor: Color(0xFFFFFFFF),
        hintColor: Color(0xFF335AA6),
        hoverColor: Color(0xFF032059),
        indicatorColor: Color(0xFF032059),
        primaryColorDark: Color(0xFF8C203D),
        primaryColorLight: Color(0xFF335AA6),
        // scaffoldBackgroundColor: Color(0xFFFFFFFF),
        secondaryHeaderColor: Color(0xFFD9043D),
        shadowColor: Color(0xFF032059),
        splashColor: Color(0xFF8C203D),
        unselectedWidgetColor: Color(0xFFBAC5D9),

        // Text Theme
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFF335AA6)),
          bodyText2: TextStyle(color: Color(0xFF032059)),
          headline6: TextStyle(color: Color(0xFF8C203D)),
        ),

        // AppBar Theme
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF8C203D),
        ),

        // Button Theme
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF032059),
        ),
      ),
      home: MainPage(),
    );
  }
}
