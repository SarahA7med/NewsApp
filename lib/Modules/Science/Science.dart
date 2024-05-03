import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class Science extends StatelessWidget {
  const Science({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: ( context,  state) {  },
      builder: ( context,  state){
        var list =NewCubit.get(context).science;
        return articleBuilder(list,context);

      },

    );
  }
}
