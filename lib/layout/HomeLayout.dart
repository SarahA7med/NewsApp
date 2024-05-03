import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/remote/dio_helper.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: ( context, state) {
        var cubit= NewCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                Icons.search
              )),
              IconButton(
                  onPressed: (){
                    NewCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                Icons.brightness_4_outlined
              )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){

            },
            child:Icon(
              Icons.add
            ) ,
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
    },
    );
  }
}
