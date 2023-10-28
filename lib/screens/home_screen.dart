import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:small_store_app/screens/all_products.dart';
import 'package:small_store_app/screens/category_screen.dart';
import 'package:small_store_app/screens/user_screen.dart';
import 'package:small_store_app/widget/appbar_icons.dart';
import 'package:small_store_app/widget/item_feeds.dart';
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
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // elevation: 4,
          title: const Text('Home'),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                context,
                PageTransition(
                  child: CategoriesScreen(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            icon: IconlyLight.category,
          ),
          actions: [
            AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: UsersScreen(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              icon: IconlyLight.user2,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: textController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: const Icon(IconlyLight.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Theme.of(context).highlightColor,
                    ))),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.3,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const SaleWidget();
                          },
                          pagination: SwiperPagination(
                              margin: EdgeInsets.only(
                                top: 15,
                                bottom: 5,
                              ),
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                activeColor: Colors.black,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ALL PRODUCTS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          AppBarIcons(
                            function: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    child: AllProducts(),
                                    type: PageTransitionType.bottomToTop,
                                  ));
                            },
                            icon: IconlyLight.arrowRight,
                          ),
                        ],
                      ),
                      GridView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 1.0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return ItemFeeds();
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
