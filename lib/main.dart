// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc_selector/bloc/user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BlocSelector<UserBloc, UserState, String>(
              selector: (state) => state.user.name,
              builder: (context, name) {
                print("refresh title");
                return Text("Welcome $name");
              })),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              print("refresh body");
              return Text(
                  "Hi many name is ${state.user.name} and my age ${state.user.age} year old");
            }),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    fillColor: Colors.lightBlue,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(BirthdayEvent());
                },
                child: Text("Birthday")),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<UserBloc>()
                      .add(ChangeNameEvent(controller.text));
                },
                child: Text("Change name"))
          ],
        ),
      ),
    );
  }
}
