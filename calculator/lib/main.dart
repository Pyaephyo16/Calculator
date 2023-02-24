import 'package:calculator/blocs/home_bloc.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => HomeBloc(),
      child: Selector<HomeBloc,ThemeMode>(
        selector: (context,bloc) => bloc.chooseTheme,
        shouldRebuild: (pre,next) => pre != next,
        builder: (context,th,child){
          print("main th "+th.toString());
          return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: th,
          theme: ThemeData(
            primaryColor: Colors.orange[400],
            primaryColorLight: Colors.white,
            primaryColorDark: Colors.white,
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.orange[400],
            primaryColorLight: Colors.black,
            primaryColorDark: Colors.orange[400],
          ),
          home:const HomePage(),
        );
        }
         
      ),
    );
  }
}