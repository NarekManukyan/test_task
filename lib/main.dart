import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_task/constants/gender.dart';
import 'package:test_task/models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Stream<User> _userStream = (() {
    late final StreamController<User> controller;
    controller = StreamController<User>(
      onListen: () async {
        controller.add(User("Nark", DateTime.now(), Gender.FEMALE,));
      },
    );
    return controller.stream;
  })();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.title),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: StreamBuilder<User>(
              stream: _userStream,
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (_, index) {
                      return ListTile(title: snapshot.,);
                    },
                    childCount: 10 ,
                  ),
                )
                ;
              },
            ),
          ),
        ],
      ),
    );
  }
}
