import 'package:flutter/material.dart';
import 'package:small_store_app/model/products_model.dart';
import 'package:small_store_app/services/api_services.dart';
import 'package:small_store_app/widget/item_feeds.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  late List<ProductsModel> productmodelList;

  @override
  void didChangeDependencies() {
    getData();
    super.didChangeDependencies();
  }

  Future<void> getData() async {
    productmodelList = await ProductsApiServices.productiapiServices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // elevation: 4,
          title: const Text('PRODUCTS'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      GridView.builder(
                        itemCount: productmodelList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 1.0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return ItemFeeds(
                            image: productmodelList[index].images![0],
                            title: productmodelList[index].title.toString(),
                          );
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
