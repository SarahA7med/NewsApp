import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/layout/HomeLayout.dart';
import 'package:newsapp/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(
        create: (BuildContext context) =>NewCubit())
    ],
      child: BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange
            ),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme:AppBarTheme(
                backgroundColor:Colors.white,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark
                ),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
                iconTheme: IconThemeData(
                    color: Colors.black
                )




            ),
            bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                elevation: 20.0

            ),
            textTheme:TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight:FontWeight.w600,
                    color: Colors.black
                )

            )
        ),
        darkTheme: ThemeData(
            primarySwatch: Colors.deepOrange,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange
            ),
            scaffoldBackgroundColor: HexColor('333739'),
            appBarTheme:AppBarTheme(
              backgroundColor:HexColor('333739'),
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark
              ),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
              iconTheme: IconThemeData(
                  color: Colors.white
              ),


            ),
            bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739'),
                elevation: 20.0
            ),
            textTheme:TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight:FontWeight.w600,
                    color: Colors.white
                )

            )
        ),
        themeMode:NewCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
        home:  HomeLayout(),
      );
    },
    ),
    );
  }
}


