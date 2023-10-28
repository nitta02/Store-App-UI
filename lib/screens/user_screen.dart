import 'package:flutter/material.dart';
import 'package:small_store_app/widget/user_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return const UsersWidget();
            }));
  }
}
