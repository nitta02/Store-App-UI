import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductsModel> productsList = [];
  int limit = 10;
  // bool _isLoading = false;
  bool _isLimit = false;
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  Future<void> getProducts() async {
    productsList = await APIHandler.getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController.addListener(() async {
      if (limit == 30) {
        _isLimit = true;
        setState(() {});
        return;
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _isLoading = true;

        limit += 10;
        log("limit $limit");

        await getProducts();
        // _isLoading = true;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body: productsList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productsList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 0.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 0.7),
                      itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider.value(
                            value: productsList[index],
                            child: const FeedsWidget());
                      }),
                  if (!_isLimit)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
    );
  }
}
