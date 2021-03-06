import 'package:block_network_example/bloc/User_bloc.dart';
import 'package:block_network_example/cubit/user_cubit.dart';
import 'package:block_network_example/services/user_repository.dart';
import 'package:block_network_example/widgets/action_buttons.dart';
import 'package:block_network_example/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Bloc with network"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(child: UserList(),),
          ],
        ),
      ),
    );
  }
}
