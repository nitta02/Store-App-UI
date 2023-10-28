import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:small_store_app/widget/appbar_icons.dart';
import 'package:small_store_app/widget/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // elevation: 4,
          title: const Text('Home'),
          leading: AppBarIcons(
            function: () {},
            icon: IconlyLight.category,
          ),
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconlyLight.user2,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: textController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: Icon(IconlyLight.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Theme.of(context).highlightColor,
                    ))),
              ),
              SizedBox(
                height: 15,
              ),
              SaleWidget()
            ],
          ),
        ),
      ),
    );
  }
}
