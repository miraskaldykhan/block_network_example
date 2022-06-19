//import 'package:block_network_example/bloc/User_bloc.dart';
import 'package:block_network_example/bloc/user_event.dart';
import 'package:block_network_example/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = context.read<UserCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          child: Text("Загрузить"),
          onPressed: () {
            userCubit.fetchUser();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
        ),
        SizedBox(width: 8,),
        ElevatedButton(
          child: Text("Clear"),
          onPressed: () {
            userCubit.clearUsers();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
      ],
    );
  }
}
