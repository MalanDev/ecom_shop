import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_shop/config/assets_manager.dart';
import 'package:ecom_shop/config/color_manager.dart';
import 'package:ecom_shop/config/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widget/feature_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchTextChanged(String value) {}

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColorManager.primary,
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchTextChanged,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      hintText: 'Enter search term',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Icon(Icons.production_quantity_limits)
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
              decoration: const BoxDecoration(
                color: AppColorManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppMargin.m16),
                  topRight: Radius.circular(AppMargin.m16),
                ),
              ),
              child: Column(children: [
                CarouselSlider(
                  options: CarouselOptions(height: 200.0),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.all(AppMargin.m12),
                          color: Colors.amber,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.asset(ImagePngAssets.appLogo)),
                        );
                      },
                    );
                  }).toList(),
                ),
                const Padding(
                  padding: EdgeInsets.all(AppPadding.p12),
                  child: Divider(),
                ),
                SizedBox(
                    height: size.height * 0.38,
                    child: GridView.builder(
                      itemCount: 40,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.75,
                      ),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return const FeatureItem();
                      },
                    ))
              ])),
        )
      ]),
    );
  }
}
