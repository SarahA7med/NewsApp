import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/Buisness/Buisness.dart';
import 'package:newsapp/Modules/Science/Science.dart';
import 'package:newsapp/Modules/Sports/Sports.dart';
import 'package:newsapp/cubit/states.dart';

import '../remote/dio_helper.dart';

class NewCubit extends Cubit<NewsStates>
{
  NewCubit(): super(NewsInitialStates());
  static NewCubit get(context)=> BlocProvider.of(context);
  int currentIndex =0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business
        ),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports
        ),
      label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science
        ),
      label: 'Science'
    ),

  ];
  List<Widget>screens=[
    Buisness(),
    Sports(),
    Science(),
  ];
  void changeBottomNavBar(int index)
  {
    currentIndex=index;
    if(index==1) {
      getSports();
    }
    if(index==2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }
  List<dynamic>business=[];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
    url: 'v2/top-headlines',
    query:{
      'country':'eg',
      'category':'business',
      'apikey':'063021745db5400faa245238618192b5',
    },
  ).then((value) {
    //print(value.data['articles'][0]['title']);
    business=value.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
  });

  }
  List<dynamic>sports=[];
  void getSports()
  {
    emit(NewsGetBusinessLoadingState());
    if(sports.isEmpty)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country':'eg',
            'category':'sports',
            'apikey':'063021745db5400faa245238618192b5',
          },
        ).then((value) {
          //print(value.data['articles'][0]['title']);
          sports=value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      } else
        {
          emit(NewsGetSportsSuccessState());
        }

  }
  List<dynamic>science=[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.isEmpty)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country':'eg',
            'category':'science',
            'apikey':'063021745db5400faa245238618192b5',
          },
        ).then((value) {
          //print(value.data['articles'][0]['title']);
          science=value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetScienceSuccessState());
        }


  }
  bool isDark =false;
  void changeAppMode()
  {
    isDark=!isDark;
    emit(AppChangeModeState());
  }
}