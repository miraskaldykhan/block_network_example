import 'package:block_network_example/bloc/User_bloc.dart';
import 'package:block_network_example/cubit/user_state.dart';
import 'package:block_network_example/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text(
            "No Data Received. Press button load",
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      if (state is UserLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue,
            child: ListTile(
              leading: Text(
                "ID: ${state.loadedUser[index].id}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    "${state.loadedUser[index].name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${state.loadedUser[index].email}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "${state.loadedUser[index].phone}",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
      if (state is UserErrorState) {
        return Center(
          child: Text(
            "Error fetching users",
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
      return null;
    });
  }
}
